class JwtAuth

  def initialize app
    @app = app
    @jwt_issuer = 'zoral.com'
    @jwt_secret = 'keepitsecret'
  end

  def call env
    begin
      options = {algorithm: 'HS256', iss: @jwt_issuer}
      bearer = env.fetch('HTTP_AUTHORIZATION', '').slice(7..-1)
      payload, header = JWT.decode bearer, @jwt_secret, true, options

      env[:scopes] = payload['scopes']
      env[:customer] = payload['customer']

      @app.call env
    rescue JWT::DecodeError
      [401, {'Content-Type' => 'text/plain'}, ['A token must be passed.']]
    rescue JWT::ExpiredSignature
      [403, {'Content-Type' => 'text/plain'}, ['The token has expired.']]
    rescue JWT::InvalidIssuerError
      [403, {'Content-Type' => 'text/plain'}, ['The token does not have a valid issuer.']]
    rescue JWT::InvalidIatError
      [403, {'Content-Type' => 'text/plain'}, ['The token does not have a valid "issued at" time.']]
    end
  end

end

class Customer < Sinatra::Base
  use JwtAuth

  ActionMailer::Base.smtp_settings = {
      :address => "smtp.office365.com",
      :port => '587',
      :authentication => :login,
      :enable_starttls_auto => true,
      :user_name => 'kyrylo.shakirov@zorallabs.com',
      :password => '',
  }
  ActionMailer::Base.view_paths = 'views/'


  def get_customer_id env_customer
    env_customer.first['id']
  end

  configure do
    set :customerBackEnd, TurboCassandra::CustomerBackEnd.new
    set :orderBackEnd, TurboCassandra::OrderBackEnd.new
    set :groupPriceBackEnd, TurboCassandra::GroupPriceBackEnd.new
    set :cartBackEnd, TurboCassandra::CartBackEnd.new
  end


  before do
    content_type :json
  end

  get '/test' do
    scopes, customer = request.env.values_at :scopes, :customer
    customer_name = customer

    if scopes.include?('view_prices')
      {money: customer_name}.to_json
    else
      halt 403
    end
  end
  get '/account' do
    scopes, customer = request.env.values_at :scopes, :customer

    if scopes.include?('view_prices')
      settings.customerBackEnd.get_customer_info customer['id']
    else
      halt 403
    end
  end

  get '/order' do
    scopes, customer = request.env.values_at :scopes, :customer

    if scopes.include?('view_prices')
      settings.orderBackEnd.get_order_by_customer_id(customer['id'])
    else
      halt 403
    end
  end

  get '/product/:id/price' do
    customer = request.env.values_at :customer
    sku = params[:id].to_i
    price = settings.groupPriceBackEnd.get_price(sku, 'W')
    {price: price}.to_json

  end

  get '/cart' do
    customer = request.env.values_at :customer
    customer_id = customer.first['id']
    settings.cartBackEnd.find(customer_id)
  end

  post '/cart/product' do
    customer_id = get_customer_id(request.env.values_at :customer)
    request_payload = JSON.parse request.body.read
    settings.cartBackEnd.add_item(customer_id, request_payload['product'],
                                  request_payload['price'], request_payload['qty'])
  end

  delete '/cart/product/:id' do
    customer_id = get_customer_id(request.env.values_at :customer)
    settings.cartBackEnd.delete_item(customer_id, params[:id].to_i)
  end

  get '/order/new' do
    customer = request.env.values_at :customer
    customer_id = customer.first['id']
    settings.orderBackEnd.create_order(customer_id)
  end

  get '/order/:id' do
    settings.orderBackEnd.get_order(params[:id].to_i)
  end

  post '/order/save' do
    customer = request.env.values_at :customer
    customer_id = customer.first['id']
    request_payload = JSON.parse request.body.read
    order_data = settings.orderBackEnd.save(customer_id, request_payload)
    customer = JSON.parse(settings.customerBackEnd.get_customer_info customer_id)
    email = Mailer.place_order customer, order_data
    begin
    email.deliver
    {order_id: order_data['order_id'], mailed: true}.to_json
    rescue
      {order_id: order_data['order_id'], mailed: false}.to_json
    end
  end

  get '/data' do
    scopes, customer = request.env.values_at :scopes, :customer
    settings.customerBackEnd.get_customer_data customer
  end

  put '/account/' do
    customer_data = JSON.parse request.body.read
    settings.customerBackEnd.update customer_data
  end

  put '/account/password/' do
    customer_data = JSON.parse request.body.read
    result = settings.customerBackEnd.update_password customer_data
    if result
      200
    else
      401
    end
  end

end
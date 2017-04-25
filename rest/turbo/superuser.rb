class SuperUser < Sinatra::Base

  use JwtAuth
  register Sinatra::ConfigFile
  helpers Sinatra::Cookies
  config_file '../../config/config.yaml'


  configure do
    set :userController, TurboCassandra::Controller::User.new
    set :currencyController, TurboCassandra::Controller::Currency.new
  end


  # def logged_in?
  #   scopes, customer = request.env.values_at :scopes, :customer
  #   if customer['id'] == 488
  #     return true
  #   end
  #   false
  # end


  set(:probability) { |value|
    condition {
      scopes, customer = request.env.values_at :scopes, :customer
      if customer['id'] == 487
        true
      else
        false
      end
    }
  }


  before do
    content_type :json
  end

  get '/user/', :probability => true do
    settings.userController.get_users_list
  end

  get '/user/:login' do
    settings.userController.get_user params
  end

  post '/user/' do
    settings.userController.create_user request.body.read
  end

  delete '/user/:login' do
    settings.userController.delete_user params
  end

  not_found do
    403
  end


  after do
    response.body = JSON.dump(response.body)
  end

end
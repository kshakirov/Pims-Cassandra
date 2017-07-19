
require_relative '../../lib/WebAPI/web_source'
class WebAPI < Sinatra::Base

  #use JwtAuth

  configure do
    set :attributeWebAPI, TurboCassandra::WebAPI::Attribute::Attribute.new
    set :attributeSetWebAPI, TurboCassandra::WebAPI::AttributeSet::AttributeSet.new
    set :attributeTypeWebAPI, TurboCassandra::WebAPI::AttributeType::AttributeType.new
    set :productWebAPI, TurboCassandra::WebAPI::Product::Product.new

  end


  before do
    content_type :json
  end

  get '/products/attributes/types' do
    settings.attributeTypeWebAPI.get
  end

  get '/products/attributes/:attribute_code' do
    settings.attributeWebAPI.get(params)
  end

  delete '/products/attributes/:attribute_code' do
    settings.attributeWebAPI.delete(params)
  end

  post '/products/attributes' do
    settings.attributeWebAPI.create(request.body.read)
  end

  post '/pims/products/attributes/:attribute_code/options' do
    settings.attributeWebAPI.add_option(params, request.body.read)
  end

  post '/integration/admin/token' do
    "testingToken333"
  end

  post '/products/attribute-sets' do
      settings.attributeSetWebAPI.create(request.body.read)
  end


  post '/products/attribute-sets/attributes' do
    settings.attributeSetWebAPI.add_attribute(request.body.read)
  end

  delete '/products/attribute-sets/:attributeSetId' do
    settings.attributeSetWebAPI.delete(params)
  end

  get '/products/attribute-sets/:attributeSetId' do
    settings.attributeSetWebAPI.get(params)
  end

  get '/products/attribute-sets/list' do
    settings.attributeSetWebAPI.list
  end

  get '/products' do
      settings.productWebAPI.create request.body.response
  end

  after do
    unless request.path_info.include? "token"
      response.body = JSON.dump(response.body)
    end
  end


end
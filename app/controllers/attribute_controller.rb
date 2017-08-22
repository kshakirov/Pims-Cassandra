class AttributeController < ApplicationController


  before do
    content_type :json
  end

  get '/attributes/:code' do
    attribute  = Attribute.find params['code']
    unless attribute.nil?
      attribute.to_hash
    end
  end

  get '/attributes' do
    attributes = Attribute.all
    attributes
  end

  post '/attributes' do
    attribute_data  =  JSON.parse request.body.read
    attribute = Attribute.new attribute_data
    attribute.save
  end

  after do
    response.body = JSON.dump(response.body)
  end
end

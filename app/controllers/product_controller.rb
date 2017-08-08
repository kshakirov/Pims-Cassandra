class ProductController < ApplicationController
  before do
    content_type :json
  end

  get '/products/:sku' do
      product  = Product.find params['sku']
      unless product.nil?
        product.to_hash
      end
  end

  get '/products/' do
    {
        id: 'hello'
    }
  end

  after do
    response.body = JSON.dump(response.body)
  end
end

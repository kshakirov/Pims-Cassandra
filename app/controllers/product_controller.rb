class ProductController < ApplicationController
   include ProductUtils


  before do
    content_type :json
  end

  get '/products/:sku' do
      product  = Product.find params['sku']
      unless product.nil?
        product.to_hash
      end
  end

  post  '/products/paginate/' do
    params = JSON.parse request.body.read
    params['paging_state'] = get_paging_state(params)
    products = Product.paginate params
    products[:paging_state] = bin_to_hex(products[:paging_state])
    products
  end

  after do
    response.body = JSON.dump(response.body)
  end
end

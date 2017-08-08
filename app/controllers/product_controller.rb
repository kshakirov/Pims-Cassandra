class ProductController < ApplicationController

  def bin_to_hex(s)
    s.each_byte.map { |b| b.to_i }
  end

  def hex_to_bin(s)
    s.map { |x| x.chr }.join
  end

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
    products = Product.paginate params
    products[:paging_state] = bin_to_hex(products[:paging_state])
    products
  end

  after do
    response.body = JSON.dump(response.body)
  end
end

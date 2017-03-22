require_relative '../test_helper'


class TestNewProdcut < Minitest::Test
  def setup
    @new_products = TurboCassandra::Model::NewProduct.new
  end

  def test_get
    ids = @new_products.all
    assert  ids.size > 0
  end

  def test_add
    @new_products.insert({sku: 6413, visible: true, ord: 1, part_number: '1-A-2761' })
  end



end
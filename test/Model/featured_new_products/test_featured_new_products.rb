require_relative '../test_helper'


class TestCustomer < Minitest::Test
  def setup
    @featured_products = TurboCassandra::Model::FeaturedProduct.new
  end

  def test_get
    ids = @featured_products.all
    assert_equal 4 , ids.size
  end

  def test_add
    @featured_products.insert({sku: 64958, visible: true, ord: 2 })
  end

  def test_change_visibility
    result  = @featured_products.update(62923, {key: :visible, value: true})
    assert result
  end

  def test_change_order
    result  = @featured_products.update(62923, {key: :ord, value: 1})
    assert result
  end

  def test_delete
    result  = @featured_products.delete(64958)
    assert result
  end

end
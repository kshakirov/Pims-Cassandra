require_relative 'test_helper'


class TestCustomer < Minitest::Test
  def setup
    @product_model = TurboCassandra::Model::Product.new
  end

  def bin_to_hex(s)
    s.each_byte.map { |b| b.to_i }
  end

  def hex_to_bin(s)
    s.map {|x| x.chr}.join
  end


  def test_find
    product =  @product_model.find [1]
    refute_nil product
  end

  def test_paging
    res = @product_model.paginate null, 5
    assert_equal false,  res[:last]
  end
end




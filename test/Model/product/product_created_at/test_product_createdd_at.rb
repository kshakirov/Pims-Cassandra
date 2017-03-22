require_relative '../test_helper'


class TestProductCreatedAt < Minitest::Test
  def setup
    @product_created_at_model = TurboCassandra::Model::ProductCreatedAt.new
  end

  def test_insert

  end

  def test_select
    m_list = ['Turbo International']
    p_list = ['Backplate']
    res =  @product_created_at_model.paginate(m_list, p_list, 1)
    refute_nil res
    assert_equal 1, res[:results].size
    paging = res[:paging_state]
    res =  @product_created_at_model.paginate(m_list, p_list, 1, paging)
    assert_equal 1, res[:results].size
  end

end




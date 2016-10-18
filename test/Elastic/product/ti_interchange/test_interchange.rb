require_relative "../test_helper"
class TestInterchange < Minitest::Test
  def setup
    @product = TurboCassandra::Product.new
    @ti_interchange = TurboCassandra::TiInterchange.new
  end

  def test_non_ti_interchange
    p = @product.find  42875
    refute_nil p.first
   ti_interchange =  @ti_interchange.get_ti_interchange(p.first['interchanges'])
    refute_nil ti_interchange
  end
end


require_relative "../test_helper"
class TestInterchange < Minitest::Test
  def setup
    @product = TurboCassandra::Product.new
    @oe_ref_url = TurboCassandra::TiInterchange.new
  end

  def test_non_ti_interchange
    p = @product.find  42875
    refute_nil p.first
   ti_interchange =  @oe_ref_url.get_ti_interchange(p.first['interchanges'])
    refute_nil ti_interchange
  end
end


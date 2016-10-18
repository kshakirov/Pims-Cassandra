require_relative "../test_helper"
class TestOeRefUrl < Minitest::Test
  def setup
    @product = TurboCassandra::Product.new
    @oe_ref_url = TurboCassandra::OeRefUrl.new
  end

  def test_non_ti_oe_ref
    p = @product.find  840
    refute_nil p.first
    refs = @oe_ref_url.get_oe_ref_url(p.first)
    refute_nil refs
    p refs
    assert_equal refs[0][:sku], 840
  end

  def test_ti_oe_ref
    p = @product.find  43858
    refute_nil p.first
    refs = @oe_ref_url.get_oe_ref_url(p.first)
    refute_nil refs
    p refs

    assert_equal refs[1][:sku], 42941
  end
end


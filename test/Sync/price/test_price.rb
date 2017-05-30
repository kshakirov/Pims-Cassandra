require_relative 'test_helper'
class TestPrice < Minitest::Test
  def setup
    @syncer = TurboCassandra::Sync::Price::Rest.new
  end
  def test_rest
    ids = [6229,6232]
    response  = @syncer.get ids
    refute_nil response
  end
end
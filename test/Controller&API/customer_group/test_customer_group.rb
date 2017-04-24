require_relative "../test_helper"
class TestCustomerGroup < Minitest::Test

  def setup
    @customer_group_api =TurboCassandra::API::CustomerGroup.new
  end
  def test_all
    groups = @customer_group_api.all
    refute_nil groups
  end
  def test_add
    hash = {
        code: "1",
        description: "Not yet "
    }
    @customer_group_api.add_group hash
  end


end
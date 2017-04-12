require_relative "../test_helper"
class TestTemplate < Minitest::Test
  def setup
    @template_controller = TurboCassandra::Controller::Template.new
  end
  def test_load
    root = '/home/kshakirov/git/cassandra/ti_cassandra/sinatra_cassandra/rest/turbo'
    filename = { 'name' => 'place_order.html.erb'}
    response = @template_controller.load root, filename
    assert response.key? :file
  end
end
require_relative '../test_helper'


class TestAttributeSet < Minitest::Test
  def setup
    @attribute_model = TurboCassandra::Model::Attribute.new


  end
  def test_by_codes
    attributes = @attribute_model.find_by_codes ['bltscrwDiagram','bltscrwWeight', 'bltscrwSpecialfeaturesonoff']
    refute_nil attributes
  end

end
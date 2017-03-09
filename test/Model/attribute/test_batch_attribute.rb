require_relative 'test_helper'


class TestAttributeBatch < Minitest::Test
  def setup
    @attribute_batch = TurboCassandra::Model::AttributeBatch.new
    @attributes = read_attributes_from_file
    @attribute = TurboCassandra::Model::Attribute.new

  end
  def test_adopt
    result  = @attribute_batch.adopt_hash @attributes[0]
    refute_nil result
    names, values, args = @attribute.insert result
  end


end
ENV['RACK_ENV']='development'

require_relative '../test_helper'


class TestAttribute < Minitest::Test
  def setup


  end
  def test_by_codes
    attributes = Attribute.find_in_by code:  ['is_active']
    refute_nil attributes
  end

  def test_find
    code = 'is_active'
    attribute = Attribute.find code
    assert_equal 'is_active',attribute.code
  end

  def test_create
    data = {
        code: 'test_attr',
        type: 'decimal'
    }
    attrbute = Attribute.new data
    attrbute.save
  end


  def test_delete
    code = 'test_attr'
    Attribute.delete code
  end

end
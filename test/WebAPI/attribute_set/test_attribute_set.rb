require_relative "../test_helper"
class TestAttributeSet < Minitest::Test

  def setup
    @attribute_set_web_api =TurboCassandra::WebAPI::AttributeSet::AttributeSet.new
  end

  def test_create
    file_content = IO.read('attribute_set.json')
    data = JSON.parse file_content
    response = @attribute_set_web_api.create data.to_json
    assert response
  end

  def test_delete
    params = {'attributeSetId' => 'pims_default'}
    response = @attribute_set_web_api.delete params
    assert response
  end

  def test_get
    params = {'attributeSetId' => 'pims_default'}
    response = @attribute_set_web_api.get params
    assert response
  end

  def test_list
    response = @attribute_set_web_api.list
    assert response
  end

  def test_add_attribute
    body = {
        "attributeSetId": 'pims_default',
        "attributeGroupId": 0,
        "attributeCode": "pims_first",
        "sortOrder": 0
    }
    response = @attribute_set_web_api.add_attribute body.to_json
    assert response
  end



end
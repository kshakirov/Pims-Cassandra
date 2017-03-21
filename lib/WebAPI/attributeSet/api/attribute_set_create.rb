module TurboCassandra
  module WebAPI
    module AttributeSet
      module Create

        def create_set_code attribute_set_name
          code = attribute_set_name.titleize
          code = code.gsub(' ', '')
          code.underscore
        end

        def prepare_response code, attribute_set_data
          {
              "attributeSetId": code,
              "attributeSetName": attribute_set_data['attributeSet']['attribute_set_name'],
              "sortOrder": 0,
              "entityTypeId": 0,
              "extensionAttributes": {}
          }
        end

        def prepare_data code, attribute_set_data
          {
              code: code,
              name: attribute_set_data['attributeSet']['attribute_set_name']
          }
        end

        def _create attribute_set_data
          code = create_set_code(attribute_set_data['attributeSet']['attribute_set_name'])
          @attribute_set_api.create(prepare_data(code, attribute_set_data))
          prepare_response(code, attribute_set_data)
        end
      end
    end
  end
end
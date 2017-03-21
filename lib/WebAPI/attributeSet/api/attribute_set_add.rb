module TurboCassandra
  module WebAPI
    module AttributeSet
      module AddAttribute
        def get_params attribute_data
          return attribute_data['attributeSetId'],
              attribute_data['attributeCode']

        end
        def _add_attribute attribute_data
          attribute_set_code, attribute_code = get_params(attribute_data)
          @attribute_set_api.add_attribute(attribute_set_code, attribute_code)
        end
      end
    end
  end
end

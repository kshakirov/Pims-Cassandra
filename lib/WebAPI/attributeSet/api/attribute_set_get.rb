module TurboCassandra
  module WebAPI
    module AttributeSet
      module Get

      def prepare_response code, attribute_set_data
          {
              "attributeSetId": code,
              "attributeSetName": attribute_set_data['name'],
              "sortOrder": 0,
              "entityTypeId": 0,
              "extensionAttributes": {}
          }
        end

        def preprocess_list sets
            sets.map{|s| prepare_response(s['code'], s)}
        end

        def _list
          sets  = @attribute_set_api.find_all
          preprocess_list(sets)
        end

        def _get attribute_set_code
          attribute_set_data = @attribute_set_api.find_by 'code', attribute_set_code
          prepare_response(attribute_set_code, attribute_set_data)
        end
      end
    end
  end
end
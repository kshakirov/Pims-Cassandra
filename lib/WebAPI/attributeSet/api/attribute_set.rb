module TurboCassandra
  module WebAPI
    module AttributeSet
      class AttributeSet
        include TurboCassandra::WebAPI::AttributeSet::Create
        include TurboCassandra::WebAPI::AttributeSet::Get
        include TurboCassandra::WebAPI::AttributeSet::AddAttribute
        attr_accessor :attribute_set_api
        def initialize
          @attribute_set_api = TurboCassandra::API::AttributeSet.new
        end

        def create body
            body = JSON.parse body
            _create(body)
        end

        def update attribute_code

        end

        def delete params
            attribute_set_code = params['attributeSetId']
            @attribute_set_api.delete attribute_set_code
          true
        end

        def get params
          attribute_set_code = params['attributeSetId']
          _get(attribute_set_code)
        end

        def list
          _list
        end

        def add_attribute  body
          attribute_data = JSON.parse body
          _add_attribute(attribute_data)
          true
        end


      end
    end
  end
end
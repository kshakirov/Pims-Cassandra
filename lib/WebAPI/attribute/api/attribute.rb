module TurboCassandra
  module WebAPI
    module Attribute
      class Attribute
        include AttributeCreate
        include AttributeGet
        include AttributeAddOption
        attr_accessor :attribute_api
        def initialize
          @attribute_api = TurboCassandra::API::Attribute.new
        end

        def create body
            body = JSON.parse body
            _create(body)
        end

        def update attribute_code

        end

        def delete params
            attribute_code = params['attribute_code']
            @attribute_api.delete attribute_code
        end

        def get params
          attribute_code = params['attribute_code']
          _get(attribute_code)
        end

        def add_option  params, body
            option = JSON.parse body
            attribute_code = params['attribute_code']
          _add_option(attribute_code, option)
        end

      end
    end
  end
end
module TurboCassandra
  module WebAPI
    module Product
      class Product
        def _create body
          {
              sku: body['sku'],
              name: body['name'],
              description: body['description']
          }
        end


        def group_key_to_attr key
          @keys[key.downcase.to_sym]
        end

        def group_values_to_attr values
          Hash[values.map {|h| [h['attribute_code'], h['value']]}]
        end

        def process_groups groups
          attrs = groups.map do |group|
            custom_group = group_key_to_attr group.first
            custom_attrs = group_values_to_attr group[1]
            Hash[custom_group, custom_attrs]
          end
          Hash[attrs.map{|h| [h.keys.first,  h.values.first]}]
        end


        def process_custom_attrs body
          attrs = body['custom_attributes']
          groups = attrs.group_by {|h| h['value'].class.name}
          process_groups groups
        end

        def initialize
          @product_api = TurboCassandra::API::Product.new
          @attribute_api = TurboCassandra::API::Attribute.new
          @keys = {
              string: 'custom_text',
              fixnum: 'custom_integer',
              double: 'custom_decimal',
              float: 'custom_decimal',
              falseclass: 'custom_boolean',
              trueclass: 'custom_boolean',
          }
          #a.first['String'].map{|h| [h['attribute_code'], h['value']]}
        end

        def create body
          body = JSON.parse body
          product_hash = _create(body['product'])
          custom_attrs = process_custom_attrs body['product']
          unless custom_attrs.nil?
            product_hash.merge!(custom_attrs)
          end
          @product_api.create(product_hash)
        end

      end
    end
  end
end
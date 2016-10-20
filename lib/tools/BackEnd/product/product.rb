module TurboCassandra
  class ProductBackEnd
    public
    def initialize
    @product = Product.new
    @attribute = Attribute.new
    end
    private
    def get_set_attributes product
      attrs = @attribute.find_by_set_name(product['part_type'])
      Hash[attrs.map{|a| [a['code'], a]}]
    end


    def build_tolerance tolerance_attribute, tolerance_value
      {
          "inches": tolerance_value[0],
          "scale": tolerance_attribute['scale'],
          "centimeters": tolerance_value[0] * 25.4
      }
    end

    def get_tolerance key_value, attrs, product_critical
      tolerance_attribute = attrs.values.select{|a| a['parent_id'] == key_value[0]}
      unless tolerance_attribute.nil? or tolerance_attribute.empty?
          tolerance_value = product_critical.select{|pc| pc ==key_value[0]}
          build_tolerance tolerance_attribute.first, tolerance_value.values
      end
    end

    def create_critical_item key_value, attrs, product_critical
      {
          "label": attrs[key_value[0]]['label'],
          "value": {
              "inches": key_value[1],
              "centimeters": key_value[1] * 25.4
          },
          "critical": true,
          "decimal": true,
          "scale": attrs[key_value[0]]['scale'],
          "unit": attrs[key_value[0]]['unit'],
          "applicable": true,
          "tolerance": get_tolerance(key_value, attrs, product_critical)
      }
    end

    def add_critical_attributes product
      attrs = get_set_attributes(product)
      product['critical_decimal'].map{|key_value|
          create_critical_item(key_value, attrs, product['critical_decimal'])
      }
    end
    def _get_product sku
      product = @product.find(sku).first
      if product.key? 'critical_decimal' and   not product['critical_decimal'].nil?
        product['critical'] = add_critical_attributes(product)
      end
      product

    end
    public
    def get_product sku
        _get_product(sku).to_json
    end
  end
end
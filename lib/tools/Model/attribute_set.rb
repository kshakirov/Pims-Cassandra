module TurboCassandra
  class AttributeSet
    def prepare_parameters properties
        return properties.keys.join(","),
            properties.values.map{|v| "'" + v + "'" }.join(",")
    end
    def insert properties
        prepare_parameters properties
    end
    def update_attribute_list attribute_set_code,  attribute_code
      "UPDATE attribute_sets   SET attributes = [ '#{attribute_code}' ] + attributes WHERE code = '#{attribute_set_code}'"
    end
  end
end
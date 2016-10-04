module TurboCassandra


  class BatchManager
    def is_exclude? key
      key == 'where_used' or
          key=='custom_attrs' or
          key=='interchanges' or
          key=='application_detail' or
          key=='action' or
          key=='group_price' or
          key=='service_kits' or key=='bill_of_materials'
    end

    def filter_nils product_hash
      product_hash.select { |k, v| (not is_exclude? k) and (not v.nil?) }
    end

    def split_hash_to_arrays hash
      return hash.keys, hash.values
    end

    def create_names_substring names
      names.map { |n| n.to_s }.join(",")
    end

    def create_values_substring values
      values.map { |n| '?' }.join(",")
    end

    def select_integers crit_dims
      crit_dims.select { |k, v| v['type']=='INTEGER' }
    end

    def select_texts crit_dims
      crit_dims.select { |k, v| v['type']=='ENUMERATION' }
    end

    def select_decimals crit_dims
      crit_dims.select { |k, v| v['type']=='DECIMAL' }
    end

    def flatten_to_map decimals
      map = {}
      decimals.each_pair { |k, v| map[k] = v['value'] }
      map
    end

    def create_map_attributes hash
      if hash.key? 'custom_attrs'
        crit_dims = hash['custom_attrs'].select { |k, v| not v['value'].nil? }
        return flatten_to_map(select_decimals crit_dims),
            flatten_to_map(select_texts crit_dims),
            flatten_to_map(select_integers crit_dims)
      end
    end

    def add_decimals d, names, values
      unless d.nil?
        names.push 'critical_decimal'
        values.push d
      end
    end

    def add_integers i, names, values
      unless i.nil?
        names.push 'critical_integer'
        values.push i
      end
    end

    def add_texts t, names, values
      unless t.nil?
        names.push 'critical_enum'
        values.push t
      end
    end

    def add_map_attributes_query product_hash, names, values
      d, t, i = create_map_attributes(product_hash)
      add_decimals(d, names, values)
      add_integers(i, names, values)
      add_texts(t, names, values)
    end

    def run product_hash

      names, values = split_hash_to_arrays(filter_nils(product_hash))
      add_map_attributes_query(product_hash, names, values)
      return create_names_substring(names), create_values_substring(values), values
    end
  end


  class Product
    def initialize
      @batch_manager = BatchManager.new
    end

    def batch_prepare product_hash
      @batch_manager.run product_hash
    end

    def prepare_parameters product_hash
      return properties.keys.join(","),
          properties.values.map { |v| "'" + v + "'" }.join(",")
    end

    def insert properties
      prepare_parameters properties
    end

    def update_attribute_list attribute_set_code, attribute_code
      "UPDATE attribute_sets   SET attributes = [ '#{attribute_code}' ] + attributes WHERE code = '#{attribute_set_code}'"
    end
  end
end
module TurboCassandra
  class OrderBatch
    def process_order_data order_hash
      order_hash['data'].select { |k, v| not v.nil? }
    end

    def process_order_products order_hash
      order_hash['products'].map { |product|
        product[0].select { |k, v| not v.nil? }
      }
    end

    def remove_null_values order_hash
      order_hash['data'] = process_order_data(order_hash)
      order_hash['products'] = process_order_products(order_hash)
    end
  end
  class Order

    def remove_null_values attr_properties
      attr_properties.select { |k, v| not v.nil? }
    end

    def prepare_names properties
      properties.keys.map { |k| k.to_s }.join(",")
    end

    def prepare_values properties
      properties.map { |p| '?' }.join(",")
    end

    def prepare_args properties
      properties.values
    end

    def prepare_attributes attr_properties
      properties = remove_null_values(attr_properties)
      return prepare_names(properties), prepare_values(properties), prepare_args(properties)
    end

    def create_cql names, values
      "INSERT INTO orders  (#{names})  VALUES (#{values})"
    end

    def insert attr_properties
      names, values, args = prepare_attributes attr_properties
      cql = create_cql(names, values)
      # args
      execute(cql, args)
    end

    def execute cql, args
      session = TurboCluster.get_session
      statement = session.prepare(cql)
      session.execute(statement, arguments: args, consistency: :any)
    end

  end
end
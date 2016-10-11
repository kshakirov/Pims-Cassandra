module TurboCassandra

  class Product

    def  prepare_names properties
      properties.keys.map{|k| k.to_s}.join(",")
    end

    def prepare_values properties
      properties.map{|p| '?'}.join(",")
    end

    def prepare_args properties
      properties.values
    end

    def create_insert_cql names, values
       "INSERT INTO products  (#{names}) " \
            "VALUES (#{values})"
    end

    def prepare_attributes product_hash
       return prepare_names(product_hash),
           prepare_values(product_hash), prepare_args(product_hash)
    end

    def insert product_hash
      names, values, args = prepare_attributes(product_hash)
      execute( create_insert_cql(names, values), args)

    end

    def update_attribute_list attribute_set_code, attribute_code
      "UPDATE attribute_sets   SET attributes = [ '#{attribute_code}' ] + attributes WHERE code = '#{attribute_set_code}'"
    end

    def each &block
      result = start_iteration
      loop do
        result.each do |row|
          yield row
        end
        break if result.last_page?
        result = result.next_page
      end
    end

    def  start_iteration
      session = TurboCluster.get_session
      session.execute("SELECT * FROM products", page_size: 5)
    end

    def execute cql, args
      session = TurboCluster.get_session
      statement = session.prepare(cql)
      session.execute(statement, arguments: args, consistency: :one)
    end
  end
end
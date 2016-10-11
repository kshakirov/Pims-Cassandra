module TurboCassandra
  class Customer
    def prepare_names hash
      hash.keys.map{|k| k.to_s}.join(",")
    end

    def prepare_values values
      values.map{|v| "?" }.join(",")
    end
    def prepare_args hash
          hash.values
    end

    def prepare_attributes hash
      return prepare_names(hash),
          prepare_values(hash), prepare_args(hash)
    end

    def create_insert_cql names, values
      "INSERT INTO customers  (#{names}) " \
            "VALUES (#{values})"
    end

    def insert hash
      names, values, args = prepare_attributes(hash)
      execute(create_insert_cql(names,values), args)
    end

    def find id
    end

    def execute cql, args
      p cql
      p args
      session = TurboCluster.get_session
      statement = session.prepare(cql)
      session.execute(statement, arguments: args, consistency: :one)
    end
  end

end
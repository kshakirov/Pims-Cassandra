module TurboCassandra
  module Model

    class NewProduct
      include TurboCassandra::Model::Utils

      def select_all_cql
        "SELECT * from  new_products"
      end

      def create_insert_cql names, values
        "INSERT INTO new_products  (#{names}) " \
            "VALUES (#{values})"
      end

      def execute cql, args
        session = TurboCluster.get_session
        statement = session.prepare(cql)
        session.execute(statement, arguments: args, consistency: :one)
      end

      def all
        execute(select_all_cql, [])
      end

      def insert hash
        names, values, args = prepare_attributes(hash)
        execute(create_insert_cql(names, values), args)
      end

    end

  end
end
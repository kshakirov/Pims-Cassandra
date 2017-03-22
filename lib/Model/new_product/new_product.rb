module TurboCassandra
  module Model

    class NewProduct
      include TurboCassandra::Model::Utils
      include NewProductSql

      def all
        res = execute_query(select_all_cql, [])
        unless res.nil?
          res.map { |r| r }
        end
      end

      def insert hash
        names, values, args = prepare_attributes(hash)
        execute_query(create_insert_cql(names, values), args)
      end

      def delete sku
        execute_query(create_delete_cql, [sku])
        true
      end

      def update hash
        execute_query(creat_update_cql, [hash['ord'], hash['visible'], hash['sku']])
        true
      end

    end

  end
end
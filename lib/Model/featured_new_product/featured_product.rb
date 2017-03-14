module TurboCassandra
  module Model
    class FeaturedProduct
      include TurboCassandra::Model::Utils
      include FeaturedProductSql

      def all
        fps = execute_query(select_all_cql, [])
        fps.map{|fp| fp}
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
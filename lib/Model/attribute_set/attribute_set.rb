module TurboCassandra
  module Model
    class AttributeSet
      include TurboCassandra::Model::Utils
      include AttributeSetSql
      def insert attribute_set_hash
        names, values = prepare_names_values attribute_set_hash
        execute_query(create_insert_cql(names, values), prepare_args(attribute_set_hash))
      end

      def update_attribute_list attribute_set_code, attribute_code
        execute_query(create_update_cql(attribute_set_code, attribute_code), [])
      end

      def update name, value, code
        execute_query(create_update_all_cql(name), [value, code])
      end

      def find_all
        sets = execute_query(select_all_cql, []).map { |a| a }
        unless sets.nil?
          sets.map{|s| s}
        end
      end

      def find_by name, value
        one = execute_query(select_by_cql(name), [value]).map { |a| a }
        unless one.nil?
          one.first
        end
      end

      def delete code
        execute_query(delete_by_code_cql, [code])
      end

    end
  end
end
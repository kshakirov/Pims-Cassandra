module TurboCassandra


  class CustomerBatchManager
      def prepare_names hash
          hash.keys.map{|k| k.to_s}.join(",")
      end

      def prepare_values values
        values.map{|v| "?" }.join(",")
      end
      def prepare_args values
          values.map{|v|
            if v.class.name.demodulize =='Hash'
              remove_null_values v
            else
              v
            end
          }
      end
      def remove_null_values hash
        hash.select{|k,v| not v.nil? and not k=='0'}
      end

      def prepare_customer_item hash
        hash = remove_null_values hash
        return prepare_names(hash), prepare_values(hash.values), prepare_args(hash.values)
      end
  end

  class Customer
    def insert

    end
    def find id

    end
  end

end
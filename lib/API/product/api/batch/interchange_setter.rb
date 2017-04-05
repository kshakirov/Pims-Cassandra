module TurboCassandra
  module API
    module Batch
      module Interchange

        def verify_nterchanges interchanges
          if interchanges.class.name == 'Array'
            interchanges.select { |i| i.class.superclass.name != 'Integer' }
          end
        end

        def prepare_interchanges product_hash
          verification =  verify_nterchanges(product_hash['interchanges'])
          if not verification or  verification.size > 0
            product_hash['interchanges']  = []
          end
        end
      end
    end
  end
end
module TurboCassandra
  module Controller
    module ProductApplication
      private

      def get_fields
       %w(make model year engine size)
       end

      def _prepare applications
        applications.split("||").map do |row|
          props = row.split('!!')
          hash_array = get_fields.each_with_index.map do |field, index|
            [field, props[index]]
          end
          Hash[hash_array]
        end
      end

      def prepare_application product
        begin
        unless product['application_detail'].nil?
          product['application_detail'] = _prepare(product['application_detail'])
        end
        rescue Exception => e
          []
        end
      end
    end
  end
end
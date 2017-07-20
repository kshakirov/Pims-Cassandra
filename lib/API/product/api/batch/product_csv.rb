module TurboCassandra
  module API
    class ProductBatch
      def initialize path
        @product_api = TurboCassandra::API::Product.new
        @path = path
      end

      private
      def parse_csv
        CSV.read(@path, {headers: true,
                         converters: :numeric,
                         header_converters: :symbol})
      end


      def prep_prod_hash row
        {
            sku: row[:default_code].to_s,
            name: row[:name].to_s,
            description: row[:description].to_s,
        }
      end

      def process_row row
        @product_api.create(prep_prod_hash(row))
      end

      public
      def run
        csv_table = parse_csv
        csv_table.each_with_index  do |row, index|
          process_row row
          puts "Processed [#{index}]"
        end
        true
      end

    end
  end
end
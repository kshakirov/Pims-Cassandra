module TurboCassandra
  module Controller
    class CustomerGroup
      def initialize
        @customer_group_api =TurboCassandra::API::CustomerGroup.new
      end
      def all
        @customer_group_api.all
      end
      def update_group body
        hash = JSON.parse body
        @customer_group_api.add_group hash
      end
      def save_all body
        hashes = JSON.parse body
        hashes.each do |hash|
          @customer_group_api.add_group hash.compact
        end
      end
    end
  end
end
module TurboCassandra
  module Controller
    class Attribute
      public
      def initialize
        @attribute = TurboCassandra::API::Attribute.new
      end

      private

      public

      def find_all
        @attribute.find_all
      end

      def find_by_code params
        result  = @attribute.find(params['code'])
        result.first
      end

      def find_by_set_name name
        @attribute.find_by_set_name name
      end
      def all
        @attribute.all
      end
    end
  end
end
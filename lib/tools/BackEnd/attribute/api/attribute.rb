module TurboCassandra
  module API
    class Attribute
      public
      def initialize
        @attribute = TurboCassandra::Model::Attribute.new
      end

      private
      public
      def find_all
        @attribute.find_all
      end
      def find code
        @attribute.find(code)
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
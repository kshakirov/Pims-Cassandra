module TurboCassandra
  module API
    class AttributeSet
      public
      def initialize
        @attribute_set_model = TurboCassandra::Model::AttributeSet.new
      end

      public
      def find_all
        @attribute_set_model.find_all
      end

      def find_by name, value
        @attribute_set_model.find_by(name, value)
      end

      def update name, value, code
        @attribute_set_model.update('critical', set['critical'], set['code'])
      end

      def add_attribute code, attribute_code
        @attribute_set_model.update_attribute_list  code, attribute_code
      end

      def create attribute_set_data
        @attribute_set_model.insert attribute_set_data
      end

      def delete code
        @attribute_set_model.delete code
      end
    end
  end
end
module TurboCassandra
  module API
    class Currency
      def initialize
        @currency_model = TurboCassandra::Model::Currency.new
      end
      def all
        @currency_model.all
      end
      def update currencies
        @currency_model.insert currencies
      end
    end
  end
end
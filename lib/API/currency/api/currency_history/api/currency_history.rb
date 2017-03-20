module TurboCassandra
  module API
    class CurrencyHistory
      def initialize
        @currency_history_model =  TurboCassandra::Model::CurrencyHistory.new
      end
      public
      def create record
        @currency_history_model.insert(record)
      end
    end
  end
end
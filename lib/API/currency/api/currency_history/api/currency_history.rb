module TurboCassandra
  module API
    class CurrencyHistory
      public
      def create record
        currency_history = TurboCassandra::Model::CurrencyHistory.new record
        currency_history.save
      end
    end
  end
end
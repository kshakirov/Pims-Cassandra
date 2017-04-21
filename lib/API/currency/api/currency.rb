module TurboCassandra
  module API
    class Currency
      def initialize
      end

      def all
        TurboCassandra::Model::Currency.all
      end

      def update currencies
        currencies.each do |c|
          currency = TurboCassandra::Model::Currency.new currencies
          currency.save
        end
      end
    end
  end
end
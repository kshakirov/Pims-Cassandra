module TurboCassandra
  module Controller
    class Currency

      private
      def verify_currency c
        {
            code: c['code'],
            base: !!c['base'],
            rate: c['rate'].to_f
        }
      end

      def prepare_backup_rates old_currencies
        old_currencies.map { |oc| {oc['code'] => oc['rate']} }
      end

      def backup_old_currencies old_currencies
        record = {
            date: Time.new,
            rates: prepare_backup_rates(old_currencies)
        }
        @currency_history_api.create record
      end


      public

      def initialize
        @currency_api = TurboCassandra::API::Currency.new
        @currency_history_api = TurboCassandra::API::CurrencyHistory.new
      end

      def all
        @currency_api.all
      end

      def update_all body
        currencies= JSON.parse body
        old_currencies = @currency_api.all
        currencies.each { |c| @currency_api.update(verify_currency(c)) }
        backup_old_currencies(old_currencies)

      end
    end
  end
end

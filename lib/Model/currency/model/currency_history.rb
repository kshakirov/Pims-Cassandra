module TurboCassandra
  module Model
    class CurrencyHistory < BaseModel
    end
    CurrencyHistory.primary_index  = ['date']
  end
end
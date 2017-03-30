module TurboCassandra
  module Manufacturer
    private
    def get_manufacturer_code manufacturer
      @manufacturer_types.each_index.select { |i|  @manufacturer_types[i] ==manufacturer }.first
    end

    def _get_manufacturer product
      [{
           code: get_manufacturer_code(product['manufacturer']),
           name: product['manufacturer']
       }]
    end

    public
    def get_manufacturer product
        _get_manufacturer product
    end
  end
end
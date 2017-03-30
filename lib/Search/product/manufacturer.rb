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

    def rem_not_external_manufacturer product
      [{
           code: get_manufacturer_code(product['manufacturer']),
           name: "Turbo International"
       }]
    end

    public
    def get_manufacturer product
      if is_not_external_manufacturer?(product)
        rem_not_external_manufacturer product
      else
        _get_manufacturer product
      end
    end
  end
end
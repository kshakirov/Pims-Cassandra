module TurboCassandra
  class CriticalDimension
    public
    def initialize
      attribute = Attribute.new
      @attributes = attribute.all
    end

    private

    def get_attribute code
      attr = @attributes.select { |a| a['code'] == code }
      attr.first
    end

    def get_tolerance_attribute code
      tolerance = @attributes.select { |a| a['parent_id'] == code }
      if tolerance and tolerance.size > 0
        {
            inches: 0,
            centimeters: 0,
            scale: tolerance.first['scale']
        }
      end
    end


    def prepare_decimal_attributes product

      product.keys.map { |k|
        {k => {
            value: {
                inches: product[k],
                centimeters: product[k] * 2.54
            },
            scale: get_attribute(k)['scale'],
            units: get_attribute(k)['unit'],
            tolerance: get_tolerance_attribute(k),
            applicable: true
        }} }
    end

    def array_to_hash array
      Hash[array.map { |a| [a.keys.first, a.values.first] }]
    end

    public
    def get_critical_dimensions product
      if product.key? 'critical_decimal' and not product['critical_decimal'].nil?
        array_to_hash(prepare_decimal_attributes(product['critical_decimal']))
      end
    end
  end
end
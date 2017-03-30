module TurboCassandra
  module OeRefUrl
    private
    def _each_interchange interchange
      {
          part_number: interchange['part_number'],
          part_number_clean: normalize_part_number(interchange['part_number']),
          product_url: '',
          sku: interchange['id']
      }
    end


    def get_ti_oe_ref_url product
      interchanges = query_interchange_service product['sku']
      unless interchanges.nil?
        interchanges.map { |i| _each_interchange(i) }
      end
    end

    def get_not_ti_oe_ref_url product
      [{
           part_number: product['part_number'],
           part_number_clean: normalize_part_number(product['part_number']),
           product_url: '',
           sku: product['sku']
       }]
    end

    public
    def get_oe_ref_url product
      if is_ti_manufactured? product
        get_ti_oe_ref_url(product)
      else
        get_not_ti_oe_ref_url(product)
      end
    end
  end
end
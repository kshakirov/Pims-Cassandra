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


    def   _get_ti_oe_ref_url product
      interchanges = query_interchange_service product['sku']
      unless interchanges.nil?
        interchanges.map{|i| _each_interchange(i)}
      end
    end
    def _get_not_ti_oe_ref_url product
      [{
          part_number: product['part_number'],
          part_number_clean:  normalize_part_number(product['part_number']),
          product_url: '',
          sku: product['sku']
      }]
    end

    public
    def get_oe_ref_url skeleton, product
      if is_ti_manufactured? product
        _get_ti_oe_ref_url(product)
      else
        if is_not_external_manufacturer? product
          add_hidden_part(skeleton, product)
        else
          _get_not_ti_oe_ref_url(product)
        end
      end
    end
  end
end
module TurboCassandra
  module TiInterchange

    private

    def get_clean_part_number part_number
      unless part_number.nil?
        part_number.gsub('-', '').downcase
      end
    end

    def prepare_response product
      {
          ti_part: product['sku'],
          ti_sku: product['sku'],
          ti_url: "/#/part/sku",
          ti_part_number: product['part_number'],
          ti_part_number_clean: get_clean_part_number(product['part_number'])
      }
    end

    def is_ti_manufactured product
      unless product.nil?
        product['manufacturer']=='Turbo International'
      end
    end

    def _get_ti_interchange product
      response = nil
      interchanges = query_interchange_service product
      unless interchanges.nil?
        interchanges.select do |interchange|
          if is_ti_manufactured(interchange)
            response = prepare_response(interchange)
          end
        end
      end
      response
    end

    public

    def get_ti_interchange product
      unless product.nil?
        _get_ti_interchange product
      end
    end

    def get_ti_itself product
      prepare_response product
    end
  end
end
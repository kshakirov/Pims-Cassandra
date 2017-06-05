module TurboCassandra
  module TurboTools
    def is_ti_manufactured? product
      unless product.nil?
        product['manufacturer']=='Turbo International'
      end
    end

    def normalize_part_number part_number
      unless part_number.nil?
        part_number.downcase.gsub(/[^0-9a-z ]|\s+/i, '')
      end
    end

    def is_turbo? product
      product['part_type'] == 'Turbo'
    end
  end
end
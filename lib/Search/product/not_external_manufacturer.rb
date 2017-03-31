module TurboCassandra
  module NotExternalManufacturer
    @@not_external_manufacturer = ['I.H.I.']
    private
    def is_not_external_manufacturer? product
      index = @@not_external_manufacturer.find_index(product['manufacturer'])
      not index.nil?
    end

    def add_hidden_part product
      if product['part_number'].class.name == 'String'
        normalize_part_number(product['part_number'])
      end
    end


    def rem_not_external_manufacturer product
      [{
           code: get_manufacturer_code(product['manufacturer']),
           name: "Turbo International"
       }]
    end


    def gsub_ti_oe_ref_url skeleton
      if skeleton[:ti_part] and skeleton[:ti_part][:ti_sku]
        ti_product = @product_api.find_by_sku skeleton[:ti_part][:ti_sku]
        unless ti_product.nil?
          return get_oe_ref_url(ti_product), ti_product
        end
      end
    end

    public

    def map_product_to_ti product, skeleton
      if is_turbo? product
        skeleton['invisible_in_search'] = true
      else
        skeleton[:not_external_part_number] = add_hidden_part(product)
        skeleton['manufacturer'] = rem_not_external_manufacturer(product)
        skeleton['oe_ref_urls'], ti_product = gsub_ti_oe_ref_url skeleton
        skeleton['visible_in_catalog'] = false
        if not  ti_product.nil? and ti_product['description']
          skeleton['description'] = ti_product['description']
        end
      end
    end

  end
end
module TurboCassandra
  class EsProductTransformer
    def initialize
      @ti_part_manager = TiInterchange.new
    end

    def _create_turbo_model product
      [{
          code: 1, name: product['turbo_model']
      }]
    end

    def _create_turbo_type product
      [{
          code: 1, name: product['turbo_type']
      }]
    end

    def is_ti_manufacturer? product
        product['manufacturer'] == 'Turbo International'
    end

    def _create_scheleton product
      {
          description: product['description'],
          name: product['name'],
          part_number: {name: product['part_number']},
          sku: product['sku'],
          turbo_model: _create_turbo_model(product),
          turbo_type: _create_turbo_type(product)
      }
    end

    def _set_catalog_visibility scheleton,  product
      scheleton["visible_in_catalog"] = true
    end

    def add_ti_part scheleton , product
      unless is_ti_manufacturer? product
        scheleton[:ti_part] = @ti_part_manager.get_ti_interchange(product['interchanges'])
      end
    end

    def run product
      scheleton = _create_scheleton product
      add_ti_part(scheleton, product)
      _set_catalog_visibility(scheleton, product)
      scheleton
    end
  end
end
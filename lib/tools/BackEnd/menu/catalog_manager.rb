module TurboCassandra
  class CatalogManager
    public
    def initialize
      @attribute = Attribute.new
      @headers = TurboCassandra::initialize_headers
      @sorters = TurboCassandra::initialize_sorters
      @filters = TurboCassandra::initialize_filters
    end

    private

    def get_manufacturers
      manr = @attribute.find 'manufacturer'
      manr.first['options']
    end

    def get_part_types
      part = @attribute.find 'part'
      part.first['options']
    end

    def build_manufacturer_filter_item manufacturer, id
      {
          "name": manufacturer,
          "option_id": id,
          "code": "manufacturer.code"
      }
    end
    def build_part_type_filter_item part_type, id
      {
          "name": part_type,
          "option_id": id,
          "code": "part_type"
      }
    end

    def build_manufacturer_filter
      manfrs = get_manufacturers
      manfrs.each_index.map{|i| build_manufacturer_filter_item(manfrs[i],i) }
    end

    def build_part_type_filter
      parts = get_part_types
      parts.each_index.map{|i| build_part_type_filter_item(parts[i],i) }
    end

    public
    def get_headers
        @headers.to_json
    end
    def get_filters
      @filters[1]['options'] = build_manufacturer_filter
      @filters[2]['options'] = build_part_type_filter
      @filters.to_json
    end
    def get_sorters
      @sorters.to_json
    end
  end

end
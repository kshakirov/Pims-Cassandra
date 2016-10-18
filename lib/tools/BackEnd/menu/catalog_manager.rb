module TurboCassandra
  class CatalogManager
    def initialize
      @headers = TurboCassandra::initialize_headers
      @sorters = TurboCassandra::initialize_sorters
      @filters = TurboCassandra::initialize_filters
    end
    def get_headers
        @headers.to_json
    end
    def get_filters
      @filters.to_json
    end
    def get_sorters
      @sorters.to_json
    end
  end

end
module TurboCassandra
  class FeaturedProduct
    def select_all_cql
      "SELECT * from  featured_products"
    end

    def all
      execute(select_all_cql, [])
    end

    def execute cql, args
      session = TurboCluster.get_session
      statement = session.prepare(cql)
      session.execute(statement, arguments: args, consistency: :one)
    end
  end

  class NewProduct
    def select_all_cql
      "SELECT * from  new_products"
    end

    def all
      execute(select_all_cql, [])
    end

    def execute cql, args
      session = TurboCluster.get_session
      statement = session.prepare(cql)
      session.execute(statement, arguments: args, consistency: :one)
    end
  end

end
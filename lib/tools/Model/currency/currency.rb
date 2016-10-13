module TurboCassandra
  class Currency

    def select_all_cql
      "SELECT * from  currencies"
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
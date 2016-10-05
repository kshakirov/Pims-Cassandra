module TurboCassandra
  class TurboCluster
    @@session = nil
    @@keyspace = 'trash1'
    @@hosts = ['10.1.3.15', '10.1.3.16', '10.1.3.17']
    def  self.get_session
      if @@session.nil?
        @@session = create_cluster
      else
        @@session
      end
    end

    def self.create_cluster
      cluster =Cassandra.cluster(hosts: @@hosts)
      cluster.connect(@@keyspace)
    end
  end
end
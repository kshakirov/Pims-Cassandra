require_relative 'test_helper.rb'
def select cluster

  keyspace = 'trash1'
  session  = cluster.connect(keyspace) # create session, optionally scoped to a keyspace, to execute queries
  session.execute("select  * from   trash1.attributes")
end

result = select @cluster
p result

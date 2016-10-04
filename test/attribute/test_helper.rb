require_relative '../../lib/tools/Model/attribute'
require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require 'cassandra'
@cluster = Cassandra.cluster(hosts:  ['10.1.3.15','10.1.3.16','10.1.3.17'])#connects to localhost by default

def insert cluster, keys, values

  keyspace = 'trash1'
  session  = cluster.connect(keyspace) # create session, optionally scoped to a keyspace, to execute queries
  result  = session.execute("insert into  trash1.attributes (#{keys}) values (#{values})")
end


def read_attributes_from_file
  fd = File.open(__dir__ + '/../attribute.json', 'r')
  data = fd.read
  JSON.parse data
end




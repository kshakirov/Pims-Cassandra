require 'json'
require 'cassandra'
require 'active_support'
require 'active_support/all'
require_relative '../../lib/tools/Model/attribute_set'

@cluster = Cassandra.cluster(hosts:  ['10.1.3.15','10.1.3.16','10.1.3.17'])#connects to localhost by default

def read_attribute_sets_from_file
  fd = File.open(__dir__ + '/../attribute_sets_all.json', 'r')
  data = fd.read
  JSON.parse data
end

def read_attributes_from_file
  fd = File.open(__dir__ + '/../attribute.json', 'r')
  data = fd.read
  JSON.parse data
end


def insert cluster, keys, values

  keyspace = 'trash1'
  session  = cluster.connect(keyspace) # create session, optionally scoped to a keyspace, to execute queries
  result  = session.execute("insert into  trash1.attribute_sets (#{keys}) values (#{values})")
end

def execute cluster, cql

  keyspace = 'trash1'
  session  = cluster.connect(keyspace)
  result  = session.execute(cql)
end
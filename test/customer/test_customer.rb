require_relative '../test_helper'

def read_customers_from_file
  fd = File.open(__dir__ + '/../customers_production.json', 'r')
  data = fd.read
  JSON.parse data
end

cluster_manager = MyCluster.new
batch_manager= TurboCassandra::CustomerBatchManager.new
customer= TurboCassandra::Customer.new

customers_hashes = read_customers_from_file


customers_hashes.each_with_index do |customer_hash|
  customer_hash['id'] = customer_hash['id'].to_i
    names_string, values_string, args = batch_manager.prepare_customer_item  customer_hash

     cql = "INSERT INTO customers  (#{names_string}) " \
             "VALUES (#{values_string})"
    p args
    begin
      cluster_manager.execute(cql, args)
    rescue Exception => e
      puts "Error" + e.message
    end

end

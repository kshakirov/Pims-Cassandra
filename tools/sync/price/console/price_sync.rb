ENV['TURBO_MODE'] ='development'
require_relative '../../sync_helper'

product_model  =TurboCassandra::Model::ProductCreatedAt.new
price_rest = TurboCassandra::Sync::Price::Rest.new
counter = 0
paging_state = nil
done = false
until done  do
  response = product_model.paginate_by_manufacturer "Turbo International", 100, paging_state
  paging_state = response[:paging_state]
  price_rest.run response[:results]
  if  not response[:last]
    counter+=1
    puts "Iteration [#{counter}]"
  else
    puts "The end"
    done = true
  end

end


require_relative '../tools_helper'

customer_groups = %w(0 1 2 3 4 5 E R W X)

customer_groups.each do |group|
  hash = {
      code: group,
      description: "No description"
  }
  group = TurboCassandra::Model::CustomerGroup.new hash
  group.save
end
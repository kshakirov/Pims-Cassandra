require_relative '../tools_helper'
attr_set = TurboCassandra::AttributeSet.new
sets = attr_set.find_all
sets.each do |s|
  if s['attributes'] and s['attributes'].size > 0
    p s['code']
    attr_set.update('critical', true, s['code'])
  end
end
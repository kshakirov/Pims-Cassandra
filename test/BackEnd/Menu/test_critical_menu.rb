require_relative 'test_helper'

menu_manager = TurboCassandra::MenuBackEnd.new


pps =  menu_manager.get_critical_sorters 4
pp = JSON.parse pps
p pp
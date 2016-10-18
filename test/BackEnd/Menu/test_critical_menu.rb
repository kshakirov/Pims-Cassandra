require_relative 'test_helper'

menu_manager = TurboCassandra::MenuBackEnd.new


pps =  menu_manager.get_critical_sorters 0
p pps
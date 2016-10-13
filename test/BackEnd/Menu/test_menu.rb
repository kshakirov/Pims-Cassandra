require_relative 'test_helper'

menu_manager = TurboCassandra::MenuBackEnd.new
p menu_manager.get_manufacturers

p menu_manager.get_parts

p menu_manager.get_currencies

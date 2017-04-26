require_relative '../tools_helper'

user_controller = TurboCassandra::Controller::User.new
user = {
    login: 'kshakirov',
    name: "Kirill Shakirov",
    email: "kshakirov@zoral.com.ua",
    password: "test",
    must_change: true,
    authentication_node: 'Internal'
}
user_controller.create_user user.to_json

user = {
    login: 'pdthiry',
    name: "Paul Thiry",
    email: "paul@thiry.com",
    password: "test",
    must_change: true,
    authentication_node: 'TurboInternational LDAP'
}

user_controller.create_user user.to_json

user = {
    login: 'pthiry',
    name: "Paul Thiry",
    email: "paul@thiry.com",
    password: "changeme",
    must_change: true,
    authentication_node: 'Internal'
}
user_controller.create_user user.to_json


user = {
    login: 'jbond',
    name: "James Bond",
    email: "kirill.shakirov4@gmail.com",
    authentication_node: 'TurboInternational LDAP'
}

user_controller.create_user user.to_json

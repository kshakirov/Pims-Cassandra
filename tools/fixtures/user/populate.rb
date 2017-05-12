require_relative '../tools_helper'

user_controller = TurboCassandra::Controller::User.new
def to_js_from user
  js = user.to_json
  JSON.parse js
end
user = {
    login: 'kshakirov',
    name: "Kirill Shakirov",
    email: "kshakirov@zoral.com.ua",
    password: "test",
    must_change: true,
    authentication_node: 'Internal'
}
user_controller.create_user(to_js_from(user))

user = {
    login: 'pdthiry',
    name: "Paul Thiry",
    email: "paul@thiry.com",
    password: "test",
    must_change: true,
    authentication_node: 'TurboInternational LDAP'
}

user_controller.create_user(to_js_from(user))

user = {
    login: 'pthiry',
    name: "Paul Thiry",
    email: "paul@thiry.com",
    password: "changeme",
    must_change: true,
    authentication_node: 'Internal'
}
user_controller.create_user(to_js_from(user))


user = {
    login: 'jbond',
    name: "James Bond",
    email: "kirill.shakirov4@gmail.com",
    authentication_node: 'TurboInternational LDAP'
}

user_controller.create_user(to_js_from(user))

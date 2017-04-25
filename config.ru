require_relative 'rest/turbo/backend'
require_relative 'rest/turbo/customer'
require_relative 'rest/turbo/admin'
require_relative 'rest/turbo/webapi'
require_relative 'rest/turbo/superuser'

#\ -w -p 4700
run Rack::URLMap.new({
                         '/' => Public,
                         '/authorize' => AdminLogin,
                         '/customer' => Customer,
                         '/admin' =>  Admin,
                         '/superuser' =>  SuperUser,
                         '/V1' =>   WebAPI
                     })

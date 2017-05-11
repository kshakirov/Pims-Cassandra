require_relative '../tools_helper'

codes  = %W(forgotten_password order send_user_data reset_password)
template_names = %W(notification.html.erb place_order.html.erb send_user_data.html.erb send_user_forgotten_password.html.erb)
admin_email_codes = %W(support_customer sales_orders admin admin )

notification_api = TurboCassandra::API::Notification.new
template_path = 'views/mailer/'

codes.each_with_index do |code, index|
 notification_hash = {
     code: code,
     admin_email_code: admin_email_codes[index],
     template_name: IO.read(template_path + template_names[index])
 }
  notification_api.add notification_hash
end


require_relative '../tools_helper'

codes  = %W(support_customer sales_orders admin)
internal_names  = %W(SupportCustomer SalesOrders Admin)
names  = %W(Customer\ Support  Ti\ Sales Admin)
emails  = %W(support@turbointernational.com sales@turbointernational.com admin@turbointernational.com)

codes.each_with_index do |code, index|
  record = {
      code: code,
      internal_name: internal_names[index],
      sender_name: names[index],
      sender_email: emails[index]
  }
  admin_email = TurboCassandra::Model::AdminEmail.new record
  admin_email.save
end
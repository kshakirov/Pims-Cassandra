module TurboCassandra
  module Controller
    module TemplatePreview

      def prep_preview_response template
        {
            file: template
        }
      end

      def prep_data
        {
            'login' => "kshakirov@zoral.com.ua",
            'password'=> "1212fdfdfe454545",
            'authentication_node'=> "Internal"
        }
      end

      def get_admin_email_sender admin_email
        return admin_email['sender_name'], admin_email['sender_email']
      end

      def _preview body
        file_object = JSON.parse body
        if file_object['filename'].include? 'order'
          @order, @customer = create_order_data(100000001)
          sender_name, sender_email = get_admin_email_sender(file_object['admin_email'])
          renderer = ERB.new(file_object['file'])
          prep_preview_response(renderer.result(binding))
        elsif file_object['filename'].include? 'forgotten_password'
          email, password, server = "kshakirov@zoral.com.ua", "1212fdfdfe454545", "Turbointernational.com"
          sender_name, sender_email = get_admin_email_sender(file_object['admin_email'])
          renderer = ERB.new(file_object['file'])
          prep_preview_response(renderer.result(binding))

        elsif file_object['filename'].include? 'send_user_data'
          data = prep_data
          sender_name, sender_email = get_admin_email_sender(file_object['admin_email'])
          renderer = ERB.new(file_object['file'])
          prep_preview_response(renderer.result(binding))
        elsif file_object['filename'].include? 'reset_password'
          data = prep_data
          sender_name, sender_email = get_admin_email_sender(file_object['admin_email'])
          renderer = ERB.new(file_object['file'])
          prep_preview_response(renderer.result(binding))
        end

      end
    end
  end
end
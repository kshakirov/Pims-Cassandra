module TurboCassandra
  module Controller
    module TemplateNotification

      def add_subject template_data
        if template_data.data.key?  'subject'
          template_data.data['subject']
        else
          "TurboInternational Event"
        end
      end

      def prep_notification_response template, sender_email, sender_name,template_data
        {
            file: template,
            action: 1,
            admin_email: sender_email,
            admin_name: sender_name,
            subject: add_subject(template_data)
        }
      end

      def create_notification_template request
        template_data = {}
        data = {}
        case request['notification_code']
          when 'send_user_data'
            template_data = get_template('send_user_data')
            data = request['data']
          when 'reset_password'
            template_data = get_template('reset_password')
            data = request['data']
          else
        end
        renderer = ERB.new(template_data.template_name)
        sender_name, sender_email = get_admin_email_data(template_data)
        prep_notification_response(renderer.result(binding), sender_email,
                                   sender_name, template_data)
      end
    end
  end
end
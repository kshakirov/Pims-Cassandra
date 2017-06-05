require_relative "../test_helper"
class TestTemplate < Minitest::Test
  def setup
    @template_controller = TurboCassandra::Controller::Template.new
    @notification_api = TurboCassandra::API::Notification.new
    @admin_email_api = TurboCassandra::API::AdminEmail.new
  end

  def test_load
    template_code = {'name' => 'order'}
    response = @template_controller.load template_code
    assert response.key? :file
  end

  def test_preview
    template = @notification_api.get 'reset_password'
    template = template.template_name
    body = {
        file: template,
        filename: 'reset_password',
        type: 'html',
        admin_email: @admin_email_api.get('admin')
    }
    response = @template_controller.preview body.to_json
    assert response
  end

  def test_process
    body = {
        action: 'forgotten_password',
        email: 'kshakirov@zoral.com.ua',
        password: 'testpassword'
    }
    response = @template_controller.process body.to_json
    assert response
  end

  def test_order_process
    body = {
        action: 'order',
        email: 'kshakirov@zoral.com.ua',
        order_id: 100000001
    }
    response = @template_controller.process body.to_json
    assert response
  end

  def test_notifcation_template
    body = {
        action: 'notification',
        notification_code: 'reset_password',
        email: 'kshakirov@zoral.com.ua',
        data: {
            login: 'kshakirov',
            password: 'test',
            name: 'Kirill Shakirov'
        }
    }
    response = @template_controller.process body.to_json
    assert response
  end

  def test_save
    template = @notification_api.get 'order'
    template = template.template_name
    body = {
        file: template,
        filename: 'order',
        type: 'html'
    }
    response = @template_controller.save body.to_json
    assert response
  end



end
require '../test_helper'

class TestMessageLogModel < Minitest::Test
  def setup
    @message_log_model = TurboCassandra::Model::MessageLog.new
    @generator = Cassandra::Uuid::Generator.new
  end
  def test_insert
    id = @generator.now
    data = {
        customer_email: "kirill.shakirov4@gmail.com",
        id:  id,
        status: 'Queued',
        date_start:  Time.now.to_time,
        date_end:  Time.now.to_time,
        message: "Test message Forgotten password"
    }
    result  = @message_log_model.insert(data)
    assert_equal id,  result
  end

  def test_find
      result  = @message_log_model.find_by_sender_email  "kirill.shakirov4@gmail.com"
      assert result.size > 0
  end

  def test_find_id
    result  = @message_log_model.find_by_email_and_id  "kirill.shakirov4@gmail.com",
                                                       Cassandra::TimeUuid.new('516e9280-210a-11e7-8954-1fb1ffadb73a')
    assert result.size > 0
  end

  def test_update
    data = {
        message: "Updated",
        status: "Success",
        date_end: Time.now.to_time
    }
    result  = @message_log_model.update  "kirill.shakirov4@gmail.com",
                                                       Cassandra::TimeUuid.new('813f4f20-2111-11e7-afa0-7db8bc900754'), data
    assert result
  end

end
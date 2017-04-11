require '../test_helper'

class TestMessageLogController < Minitest::Test
  def setup
    @rabbit_queue = TurboCassandra::Controller::RabbitQueue.new("localhost")
    @message_log_controller = TurboCassandra::Controller::MessageLog.new @rabbit_queue.connection
  end

  def test_paginated
    body = {
        paging_state: nil,
        page_size: 10
    }
    result = @message_log_controller.paginated body.to_json
    assert_equal 10, result[:results].size
  end

  def teardown
    @rabbit_queue.connection.close
  end
end
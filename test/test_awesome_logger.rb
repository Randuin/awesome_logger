require 'test/unit'
require 'awesome_logger'

class TestAwesomeLogger < Test::Unit::TestCase
  def setup
    @logger = AwesomeLogger.new
  end

  def test_initializes_with_proper_instance_variable
    assert_kind_of Array, @logger.logs
  end

  def test_logger_instance_has_proper_logger_api_methods
    assert_respond_to @logger, :warn
    assert_respond_to @logger, :fatal
    assert_respond_to @logger, :error
    assert_respond_to @logger, :info
    assert_respond_to @logger, :debug
  end

  def test_logger_appends_log_msg_with_proper_log_level
    @logger.info 'hi'
    assert_equal :info, @logger.logs.last[:level]
  end

  def test_logger_adds_logs_with_info_default_level
    @logger.log 'hi'
    assert_equal :info, @logger.logs.last[:level]
  end

  def test_aliasd_method_for_log
    @logger << 'aliased'
    assert_equal 'aliased', @logger.logs.last[:message]
  end

  def test_logger_concact_another_logger
    new_logger = AwesomeLogger.new
    new_logger.log 'another message'
    @logger << new_logger

    assert_equal 'another message', @logger.logs.last[:message]
  end
end

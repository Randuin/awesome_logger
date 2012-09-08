require 'test/unit'
require 'awesome_logger'

class TestAwesomeLogger < Test::Unit::TestCase
  def test_initializes_with_proper_instance_variable
    logger = AwesomeLogger.new
    assert_kind_of Array, logger.logs
  end

  def test_logger_instance_has_proper_logger_api_methods
    logger = AwesomeLogger.new

    assert_respond_to logger, :warn
    assert_respond_to logger, :fatal
    assert_respond_to logger, :error
    assert_respond_to logger, :info
    assert_respond_to logger, :debug
  end

  def test_logger_appends_log_msg_with_proper_log_level
    logger = AwesomeLogger.new

    logger.info 'hi'
    assert_equal :info, logger.logs.last[:level]
  end

  def test_logger_adds_logs_with_info_default_level
    logger = AwesomeLogger.new

    logger.log 'hi'
    assert_equal :info, logger.logs.last[:level]
  end
end

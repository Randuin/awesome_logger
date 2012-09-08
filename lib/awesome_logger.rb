require "awesome_logger/version"
require "awesome_logger/formatters/console"
require 'json'

class AwesomeLogger
  extend Formatters::Console::ClassMethods
  include Formatters::Console

  LOGGER_LEVELS = [ :fatal, :error, :warn, :info, :debug ]

  attr_accessor :logs

  LOGGER_LEVELS.each do |level|
    define_method level do |message|
      log message, level
    end
  end

  def initialize
    @logs = []
  end

  def log(msg, level = :info)
    if msg.is_a?(AwesomeLogger)
      @logs += msg.logs
    else
      @logs << { :time => Time.now, :message => msg, :level => level }
    end
  end

  alias_method :<<, :log

  def to_json
    @logs.to_json
  end
end

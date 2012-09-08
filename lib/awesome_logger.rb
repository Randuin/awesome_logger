require "awesome_logger/version"
require "awesome_logger/formatter"
require "awesome_logger/formatters/console"
require "awesome_logger/formatters/json"
require "active_support/inflector"
require 'json'

class AwesomeLogger
  LOGGER_LEVELS = [ :fatal, :error, :warn, :info, :debug ]

  attr_accessor :logs
  attr_reader :formatter

  LOGGER_LEVELS.each do |level|
    define_method level do |message|
      log message, level
    end
  end

  def initialize
    @logs = []
  end

  def formatter= symbol
    @formatter = AwesomeLogger.get_formatter_by_symbol symbol
  end

  def log(msg, level = :info)
    if msg.is_a?(AwesomeLogger)
      @logs += msg.logs
    else
      @logs << { :time => Time.now, :message => msg, :level => level }
    end
  end

  alias_method :<<, :log

  def flush_to_logger logger, formatter
  end

  def output
    self.formatter.to_output @logs
  end

  def self.get_formatter_by_symbol symbol
    const_get symbol.to_s.camelize.to_sym
  rescue NameError
    nil
  end
end

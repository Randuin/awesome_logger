require "awesome_logger/version"
require 'json'

class AwesomeLogger
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
    @logs << { :time => Time.now, :message => msg, :level => level }
  end

  def <<(msg)
    if msg.is_a?(AwesomeLogger)
      @logs += msg.logs
    else
      log(msg)
    end
  end

  def to_json
    @logs.to_json
  end
end

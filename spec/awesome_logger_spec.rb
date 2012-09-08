require 'spec_helper'
require 'awesome_logger'

describe AwesomeLogger do
  before :each do
    @logger = AwesomeLogger.new
  end

  it 'should initialize with proper logs instance variable' do
    @logger.logs.should be_a Array
  end

  it 'should set the formatter correctly' do
    @logger.formatter = :console
    @logger.formatter.should be AwesomeLogger::Console
  end

  it 'should have proper logger api methods' do
    @logger.should respond_to :warn
    @logger.should respond_to :fatal
    @logger.should respond_to :error
    @logger.should respond_to :info
    @logger.should respond_to :debug
  end

  it 'should log message with proper log level' do
    @logger.info 'hi'
    @logger.logs.last[:level].should be :info
  end

  it 'should add logs with info as the default level' do
    @logger.log 'hi'
    @logger.logs.last[:level].should eq :info
  end

  it 'should have the aliased << method for loggign' do
    @logger << 'aliased'
    @logger.logs.last[:message].should eq 'aliased'
  end

  it 'should concact another logger onto the current one' do
    new_logger = AwesomeLogger.new
    new_logger.log 'another message'
    @logger << new_logger

    @logger.logs.last[:message].should eq 'another message'
  end

  it "should grab the correct formatter module via symbol" do
    formatter = AwesomeLogger.get_formatter_by_symbol :json
    formatter.should be AwesomeLogger::Json
  end

  it "should return nil when it cannot find the formatter" do
    formatter = AwesomeLogger.get_formatter_by_symbol :blah
    formatter.should be nil
  end
end

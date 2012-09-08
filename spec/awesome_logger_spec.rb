require 'spec_helper'
require 'awesome_logger'

describe AwesomeLogger do
  before :each do
    @logger = AwesomeLogger.new
  end

  it 'should initialize with proper logs instance variable' do
    @logger.logs.should be_a Array
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
end

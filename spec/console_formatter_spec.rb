require 'spec_helper'
require 'awesome_logger'

describe AwesomeLogger::Formatters::Console do
  before :each do
    @logger = AwesomeLogger.new
  end

  it 'should always reset colorized text' do
    @logger.log AwesomeLogger.red "hi"
    @logger.logs.last[:message].should match /e\[0m$/
  end

  it 'should prepend the correct color code' do
    @logger.log AwesomeLogger.red "hi"
    @logger.logs.last[:message].should match /^e\[31m/
  end

  it 'should output to the console properly' do
    @logger.log AwesomeLogger.red "hi"
    @logger.log AwesomeLogger.red "hi2"

    @logger.to_console.split("\n").should have(2).things
    @logger.to_console.should match /\[.+\]\s+\[.+\]\s+.+/
  end
end

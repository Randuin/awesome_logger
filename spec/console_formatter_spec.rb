require 'spec_helper'
require 'awesome_logger'

describe AwesomeLogger::Console do
  before :each do
    @logger = AwesomeLogger.new
    @logger.formatter = :console
  end

  it 'should always reset colorized text' do
    @logger.log AwesomeLogger::Console.red "hi"
    @logger.logs.last[:message].should match /\e\[0m$/
  end

  it 'should prepend the correct color code' do
    @logger.log AwesomeLogger::Console.red "hi"
    @logger.logs.last[:message].should match /^\e\[31m/
  end

  it 'should output to the console properly' do
    @logger.log AwesomeLogger::Console.red "hi"
    @logger.log AwesomeLogger::Console.red "hi2"

    @logger.output.split("\n").should have(2).things
    @logger.output.should match /\[.+\]\s+\[.+\]\s+.+/
  end
end

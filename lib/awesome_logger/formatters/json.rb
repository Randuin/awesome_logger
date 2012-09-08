class AwesomeLogger
  class Json < Formatter
    def self.to_output logs
      logs.to_json
    end
  end
end

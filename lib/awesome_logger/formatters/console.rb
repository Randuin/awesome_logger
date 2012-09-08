class AwesomeLogger
  class Console < Formatter
    def self.to_output logs
      output = logs.map do |l|
        "[#{ Console.red l[:time]}]\t[#{ Console.green l[:level]}]\t#{l[:message]}\n"
      end.join
    end


    def self.colorize text, color_code
      "#{color_code}#{text}\e[0m"
    end

    def self.red text; colorize text, "\e[31m"; end
    def self.green text; colorize text, "\e[32m"; end
  end
end

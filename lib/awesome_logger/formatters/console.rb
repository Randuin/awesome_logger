class AwesomeLogger
  class Console < Formatter
    def self.to_output logs
      logs.map do |l|
        wrap_line l
      end.join("\n")
    end

    def self.wrap_line l
      "[#{ Console.red l[:time]}]\t[#{ Console.green l[:level]}]\t#{l[:message]}"
    end

    def self.flush_to_logger logger, logs
      logs.each do |l|
        logger.send l[:level], wrap_line(l)
      end
    end

    def self.colorize text, color_code
      "#{color_code}#{text}\e[0m"
    end

    def self.red text; colorize text, "\e[31m"; end
    def self.green text; colorize text, "\e[32m"; end
  end
end

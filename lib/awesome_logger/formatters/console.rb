class AwesomeLogger
  module Formatters
    module Console
      def to_console
        output = @logs.map do |l|
          "[#{l[:time]}]\t[#{l[:level]}]\t#{l[:message]}\n"
        end.join
      end


      module ClassMethods
        def colorize text, color_code
          "#{color_code}#{text}e[0m"
        end

        def red text; colorize text, "e[31m"; end
        def green text; colorize text, "e[32m"; end
      end
    end
  end
end

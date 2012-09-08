class AwesomeLogger
  module Formatters
    module Json
      def to_json
        @logs.to_json
      end
    end
  end
end

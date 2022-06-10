# frozen_string_literal: true

module Bigid
  module Ocr
    class ResultCode
      FOUND = 70
      ERROR = -918
      NO_INFO = -704

      VALUES = [FOUND, ERROR, NO_INFO].freeze

      def self.valid?(code)
        VALUES.include?(code.to_i)
      end

      def self.values
        VALUES
      end

      def self.error?(code)
        code.to_i == ERROR
      end

      def self.found?(code)
        code.to_i == FOUND
      end

      def self.no_info?(code)
        code.to_i == NO_INFO
      end
    end
  end
end

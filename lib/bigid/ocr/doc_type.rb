# frozen_string_literal: true

module Bigid
  module Ocr
    class DocType
      def self.valid?(document)
        document.is_a?(String)
      end
    end
  end
end

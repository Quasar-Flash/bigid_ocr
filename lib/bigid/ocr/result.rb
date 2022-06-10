# frozen_string_literal: true

module Bigid
  module Ocr
    class Result
      attr_accessor :code, :message, :raw_data, :raw_response, :ticket_id,
                    :check_info, :doc_info, :official_info, :forensic_validations

      def initialize(code:, message:, raw_response:, score:, ticket_id:,
                    check_info:, doc_info:, official_info:, forensic_validations:)
        @raw_response          = raw_response
        @code                  = code
        @message               = message
        @ticket_id             = ticket_id
        @check_info = check_info
        @doc_info = doc_info
        @official_info = official_info
        @forensic_validations = forensic_validations
      end
    end
  end
end

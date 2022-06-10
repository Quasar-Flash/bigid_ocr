# frozen_string_literal: true

module Bigid
  module Ocr
    class Request < Bigid::Auth::AuthenticatedResource
      def call(document:, forensic_validations: false)
        res = @connection.post(
          url: Bigid::Ocr::SRV_ENDPOINT,
          body: payload(document, forensic_validations).to_json)

        check_status(res.status)

        parse_response_body(res.body, forensic_validations)
      end

      def self.call(document:, forensic_validations: false)
        new.call(document: document, forensic_validations: forensic_validations)
      end

      private
        def check_status(status)
          raise Bigid::Ocr::InternalError unless status
          raise Bigid::Ocr::ServerError if status == 500
          raise Bigid::Ocr::InvalidCredentialsError if status == 401
          raise Bigid::Ocr::BadRequestError if status == 400
        end

        def payload(document, forensic_validations)
          raise Bigid::Ocr::DocumentNotSupportedError unless DocType.valid?(document)

          {
            ForensicValidations: forensic_validations,
            Parameters: [
              "DOC_IMG_URL=#{get_document_public_url}"
            ]
          }
        end

        def check_result_code(code)
          raise Bigid::Ocr::InvalidDocumentValueError unless code
          raise Bigid::Ocr::NoInfoError if ResultCode.no_info?(code)
        end

        def parse_response_body(body, forensic_validations)
          body = JSON.parse(body)

          check_result_code(body["ResultCode"])

          Bigid::Ocr::ParseResponse.new(body)
        end
    end
  end
end

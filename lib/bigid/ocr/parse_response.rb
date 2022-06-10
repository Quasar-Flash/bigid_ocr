# frozen_string_literal: true

module Bigid
  module Ocr
    class ParseResponse
      def initialize(ocr_data)
        @ocr_data = ocr_data
      end

      def result
        Bigid::Ocr::Result.new(
          check_info: check_info,
          doc_info: doc_info,
          official_info: official_info,
          forensic_validations: forensic_validations,
          raw_response: @ocr_data.to_json,
          code: @ocr_data["ResultCode"],
          message: @ocr_data["ResultMessage"],
          ticket_id: @ocr_data["TicketId"]
        )
      end

      private
        def check_info
          item = @ocr_data["CheckInfo"]
          Bigid::Ocr::CheckInfo.new(
            name_match: item["NAMEMATCH"],
            cpf_match: item["CPFMATCH"],
            mother_name_match: item["MOTHERNAMEMATCH"],
            father_name_match: item["FATHERNAMEMATCH"]
          )
        end

        def doc_info
          item = @ocr_data["DocInfo"]
          Bigid::Ocr::DocInfo.new(
            doc_type: item["DOCTYPE"],
            cpf: item["CPF"],
            name: item["NAME"],
            birth_date: item["BIRTHDATE"],
            mother_name: item["MOTHERNAME"],
            father_name: item["FATHERNAME"],
            expedition_date: item["EXPEDITIONDATE"],
            identification_number: item["IDENTIFICATIONNUMBER"],
            valid_date: item["VALIDDATE"],
            place_of_emission: item["PLACEOFEMISSION"],
            cnh_number: item["CNHNUMBER"],
            first_qualification_date: item["FIRSTQUALIFICATIONDATE"]
          )
        end

        def forensic_validations
          item = @ocr_data["ForensicValidations"]
          item.to_json
        end

        def official_info
          item = @ocr_data["OfficialInfo"]
          Bigid::Ocr::OfficialInfo.new(
            birth_date_match: item["BIRTHDATEMATCH"],
            mother_name_match_percentage: item["NAMEMATCHPERCENTAGE"],
            official_age_in_first_qualification: item["OFFICIALAGEINFIRSTQUALIFICATION"],
            official_birth_date: item["OFFICIALBIRTHDATE"],
            official_mother_name: item["OFFICIALMOTHERNAME"],
            official_name: item["OFFICIALNAME"]
          )
        end
    end
  end
end

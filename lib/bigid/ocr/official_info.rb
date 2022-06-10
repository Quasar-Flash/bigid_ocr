# frozen_string_literal: true

module Bigid
  module Ocr
    class OfficialInfo
      attr_accessor :birth_date, :mother_name_match_percentage, :name_match_percentage, :official_age_in_first_qualification,
                    :official_birth_date, :official_mother_name, :official_name

      def initialize(birth_date: nil, mother_name_match_percentage: nil, name_match_percentage: nil, official_age_in_first_qualification: nil, official_birth_date: nil, official_mother_name: nil, official_name: nil)
        @birth_date = birth_date
        @mother_name_match_percentage = mother_name_match_percentage
        @name_match_percentage = name_match_percentage
        @official_age_in_first_qualification = official_age_in_first_qualification
        @official_birth_date = official_birth_date
        @official_mother_name = official_mother_name
        @official_name = official_name
      end
    end
  end
end

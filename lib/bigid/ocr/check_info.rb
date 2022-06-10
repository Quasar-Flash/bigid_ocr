# frozen_string_literal: true

module Bigid
  module Ocr
    class CheckInfo
      attr_accessor :name_match, :cpf_match, :mother_name_match, :father_name_match

      def initialize(name_match: nil, cpf_match: nil, mother_name_match: nil, father_name_match: nil)
        @name_match = name_match
        @cpf_match = cpf_match
        @mother_name_match = mother_name_match
        @father_name_match = father_name_match
      end
    end
  end
end

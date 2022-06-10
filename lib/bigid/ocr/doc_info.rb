# frozen_string_literal: true

module Bigid
  module Ocr
    class DocInfo
      attr_accessor :doc_type, :cpf, :name, :birth_date, :mother_name, :father_name,
                    :expedition_date, :identification_number, :valid_date,
                    :place_of_emission, :cnh_number, :first_qualification_date

      def initialize(doc_type: nil, cpf: nil, name: nil, birth_date: nil, mother_name: nil, father_name: nil, expedition_date: nil,
        identification_number: nil, valid_date: nil, place_of_emission: nil, cnh_number: nil, first_qualification_date: nil)
        @doc_type = doc_type
        @cpf = cpf
        @name = name
        @birth_date = birth_date
        @mother_name = mother_name
        @father_name = father_name
        @expedition_date = expedition_date
        @identification_number = identification_number
        @identification_uf = identification_uf
        @valid_date = valid_date
        @place_of_emission = place_of_emission
        @cnh_number = cnh_number
        @first_qualification_date = first_qualification_date
      end
    end
  end
end

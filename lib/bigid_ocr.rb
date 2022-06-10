# frozen_string_literal: true

require "i18n"
require "json"
require "cpf_cnpj"

require "bigid_auth"
require "bigid/ocr/version"

I18n.load_path += Dir[File.join(__dir__, "locales", "**/*.yml")]
I18n.reload! if I18n.backend.initialized?

module Bigid
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield(configuration)
  end

  class Configuration
  end

  module Ocr
    SRV_ENDPOINT = "VerifyID"
  end
end

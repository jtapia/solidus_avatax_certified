# frozen_string_literal: true

module Spree
  module Avatax
    def self.init
      const_set 'Config', SolidusAvataxCertified::Configuration.new
    end
  end
end

# frozen_string_literal: true

require 'solidus_avatax_certified'

module SolidusAvataxCertified
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_avatax_certified'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.frontend_available?
      const_defined?('::Spree::Frontend::Engine')
    end
  end
end

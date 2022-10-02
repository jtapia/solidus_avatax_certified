# frozen_string_literal: true

class MyConfigPreferences
  def self.set_preferences
    SolidusAvataxCertified::Config.company_code = 'DEFAULT'
    SolidusAvataxCertified::Config.license_key = '12345'
    SolidusAvataxCertified::Config.account = '12345'
    SolidusAvataxCertified::Config.refuse_checkout_address_validation_error = false
    SolidusAvataxCertified::Config.log_to_stdout = false
    SolidusAvataxCertified::Config.raise_exceptions = false
    SolidusAvataxCertified::Config.log = true
    SolidusAvataxCertified::Config.address_validation = true
    SolidusAvataxCertified::Config.tax_calculation = true
    SolidusAvataxCertified::Config.document_commit = true
    SolidusAvataxCertified::Config.customer_can_validate = true
    SolidusAvataxCertified::Config.address_validation_enabled_countries = ['United States', 'Canada']
    SolidusAvataxCertified::Config.origin = "{\"line1\":\"915 S Jackson St\",\"line2\":\"\",\"city\":\"Montgomery\",\"region\":\"AL\",\"postalCode\":\"36104\",\"country\":\"US\"}"
  end
end

RSpec.configure do |config|
  config.before do
    MyConfigPreferences.set_preferences
  end
end

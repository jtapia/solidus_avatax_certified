# frozen_string_literal: true

module SolidusAvataxCertified
  class OrderAdjuster < ::Spree::Tax::OrderAdjuster
    def adjust!
      if %w(cart address delivery).include?(order.state)
        return (order.line_items + order.shipments)
      end

      taxes = ::Spree::Config.tax_calculator_class.new(order).calculate
      ::Spree::OrderTaxation.new(order).apply(taxes)
    end
  end
end

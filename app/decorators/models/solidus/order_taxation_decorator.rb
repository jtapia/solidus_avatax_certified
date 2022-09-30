# frozen_string_literal: true

module Solidus
  module OrderTaxationDecorator
    def self.prepended(base)
      base.class_eval do
        private

        def update_adjustment(item, tax_item)
          tax_adjustment = item.adjustments.detect do |adjustment|
            adjustment.source == tax_item.tax_rate
          end

          tax_adjustment ||= item.adjustments.new(
            source: tax_item.tax_rate,
            order_id: item.is_a?(Spree::Order) ? item.id : item.order_id,
            label: tax_item.label,
            included: tax_item.included_in_price
          )
          tax_adjustment.update!(amount: tax_item.amount.to_f)
          tax_adjustment
        end
      end
    end

    ::Spree::OrderTaxation.prepend(self)
  end
end

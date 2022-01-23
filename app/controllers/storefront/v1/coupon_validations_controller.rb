# frozen_string_literal: true

module Storefront
  module V1
    class CouponValidationsController < ApiController
      def create
        @coupon = Coupon.find_by(code: params[:coupon_code])
        @coupon.validate_use!
        render :show
      rescue Coupon::InvalidUse, NoMethodError
        render_error(fields: @coupon.errors.messages)
      end
    end
  end
end

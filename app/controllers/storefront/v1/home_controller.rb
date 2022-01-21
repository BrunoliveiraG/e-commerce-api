# frozen_string_literal: true

module Storefront
  module V1
    class HomeController < ApplicationController
      def index
        @loader_service = Storefront::HomeLoaderService.new
        @loader_service.call
      end
    end
  end
end

# frozen_string_literal: true

module Storefront
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.order(:name)
      end
    end
  end
end

# frozen_string_literal: true

module Juno
  class CreditCardPayment < ApplicationRecord
    belongs_to :charge

    validates :key, :release_date, :status, presence: true
  end
end

# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :game
  belongs_to :user
end

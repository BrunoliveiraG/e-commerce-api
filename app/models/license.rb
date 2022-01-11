# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :key, presence: true, uniqueness: { case_sensitive: true }
end

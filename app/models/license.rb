# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :key, presence: true, uniqueness: { case_sensitive: true }
  validates :platform, presence: true
  validates :status, presence: true

  enum platform: { steam: 1, battle_net: 2, origin: 3 }
  enum status: { available: 1, in_use: 2, inactive: 3 }
end

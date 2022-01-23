# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :system_requirement
  has_one :product, as: :productable
  has_many :licenses
  validates :mode, presence: true
  validates :release_date, presence: true
  validates :developer, presence: true

  enum mode: { pvp: 1, pve: 2, both: 3 }

  def ship!(line_item)
    Admin::AllocateLicenseJob.perform_later(line_item)
  end

  include LikeSearchable
end

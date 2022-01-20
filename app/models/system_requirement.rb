# frozen_string_literal: true

class SystemRequirement < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :operating_system, presence: true
  validates :storage, presence: true
  validates :processor, presence: true
  validates :memory, presence: true
  validates :graphics_card, presence: true

  has_many :games, dependent: :restrict_with_error

  include LikeSearchable
  include Paginatable
end

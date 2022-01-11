# frozen_string_literal: true

FactoryBot.define do
  factory :license do
    key { Faker::Commerce.unique.promotion_code(digits: 15) }
    game
    user
  end
end

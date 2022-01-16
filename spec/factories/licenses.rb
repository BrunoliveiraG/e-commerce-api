# frozen_string_literal: true

FactoryBot.define do
  factory :license do
    key { Faker::Commerce.unique.promotion_code(digits: 15) }
    game_id { create(:game).id }
    user_id { create(:user).id }
    platform { :steam }
    status { :available }
  end
end

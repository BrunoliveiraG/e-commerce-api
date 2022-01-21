# frozen_string_literal: true

FactoryBot.define do
  factory :license do
    key { Faker::Lorem.characters(number: 15) }
    platform { :steam }
    status { :available }
    game
  end
end

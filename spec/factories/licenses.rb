# frozen_string_literal: true

FactoryBot.define do
  factory :license do
    key { 'MyString' }
    game { nil }
    user { nil }
  end
end

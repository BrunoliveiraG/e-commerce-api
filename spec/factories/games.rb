# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    mode { %i[pvp pve both].sample }
    release_date { '2021-12-16 11:35:50' }
    developer { Faker::Company.name }
    system_requirement
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    operating_system { Faker::Computer.os }
    storage { '5GB' }
    processor { 'AMD Ryzen 7' }
    memory { '2GB' }
    graphics_card { 'N/A' }
  end
end

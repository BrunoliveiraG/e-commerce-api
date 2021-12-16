FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Recommended #{n}" }
    operating_system { Faker::Computer.os }
    storage { "500gb" }
    processor { "AMD Ryzen 7" }
    memory { "2gb" }
    graphics_card { "GeForce X" }
  end
end

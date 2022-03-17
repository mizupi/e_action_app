FactoryBot.define do
  factory :contact do
    name             { Faker::Lorem.characters(number: 10) }
    content          { Faker::Lorem.paragraph }

    association :user
  end
end

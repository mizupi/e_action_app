FactoryBot.define do
  factory :user_activity do
    association :user
    association :activity
  end
end

FactoryBot.define do
  factory :relationship do
    association :user
    association :following
    association :followers
  end
end

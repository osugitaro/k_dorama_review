FactoryBot.define do
  factory :like do
    association :user, :user2
    association :review
  end
end

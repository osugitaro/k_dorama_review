FactoryBot.define do
  factory :comment do
    association :user, :user2
    association :review
    comment { "どこが面白かったですか？" }

    trait :reply do
      association :parent, factory: :comment
      comment { "段々這い上がっていくところが面白かったです！" }
    end
  end
end

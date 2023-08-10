FactoryBot.define do
  factory :review do
    association :user
    association :k_dorama
    impression { "面白かった "}
    evaluation { 4.5 }
    recommendation { "サクセスストーリーが好きな人" }
    not_recommendation { "ちょっとでも暗いシーンがあるとだめな人" }
    viewing_status { "see_all"}

    trait :review2 do
      association :user, :user2
      association :k_dorama
      impression {" つまらなかった" }
      recommendation { "仲間とか好きな人" }
      not_recommendation { "反ミーハーな人" }
      viewing_status { "frustration" }
    end
  end
end

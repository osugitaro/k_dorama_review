FactoryBot.define do
  factory :k_dorama do
    title { "梨泰院クラス" }
    introduction { "サクセスストーリー" }
    genre { "復讐系" }
    cast { "パク・ソジュン" }
    rate_average { 4.0 }

    after(:build) do |k_dorama|
      k_dorama.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'img/jpg')
    end

    trait :k_dorama2 do
      title { "マイディアミスター" }
      introduction { "ヒューマンドラマ" }
      genre { "感動系" }
      cast { "IU" }

      after(:build) do |k_dorama2|
        k_dorama2.image.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'img/jpg')
      end
    end
  end
end

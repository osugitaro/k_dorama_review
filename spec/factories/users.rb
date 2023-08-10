FactoryBot.define do
  factory :user do
    name { "kotaro" }
    email { "kotaro@gmail.com"}
    password { "kotaro1234" }

    after(:create) do |user|
      user.image.attach(io: File.open('spec/fixtures/test_icon.png'), filename: 'test_icon.png', content_type: 'img/png')
    end

    trait :user2 do
      name {" 田中 "}
      email {" tanaka@gmail.com "}
      password { "tanaka1234" }

      after(:create) do |user2|
        user2.image.attach(io: File.open('spec/fixtures/test_icon.png'), filename: 'test_icon.png', content_type: 'img/png')
      end
    end
  end
end

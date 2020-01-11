FactoryBot.define do
  factory :user do
    email { 'some@mail.com' }
    password { 'password' }

    trait :invalid_email do
      email { "invalid_email" }
    end

    trait :empty_password do
      password { nil }
    end
  end
end

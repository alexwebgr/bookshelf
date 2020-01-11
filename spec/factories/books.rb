FactoryBot.define do
  factory :book do
    title { "MyString" }
    author { "MyString" }
    date_published { "2020-01-11 12:01:03" }
    unique_identifier { "MyString" }
    publisher_name { "MyString" }

    user

    trait :invalid do
      title { nil }
      author { nil }
      date_published { nil }
      unique_identifier { nil }
      publisher_name { nil }
    end
  end
end

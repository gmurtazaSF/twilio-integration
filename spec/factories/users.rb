FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    phone_number { "+1 #{Faker::Number.unique.number(digits: 10)}" }
  end
end

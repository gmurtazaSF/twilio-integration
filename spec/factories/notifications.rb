FactoryBot.define do
  factory :notification do
    recipient_phone { Faker::PhoneNumber.phone_number }
    message { Faker::Lorem.sentence }
    trigger { Faker::Lorem.word }

    trait :special_notification do
      message { 'Special Notification Message' }
    end
  end
end

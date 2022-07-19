FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    charge_id { 2 }
    ship_day_id { 2 }
    prefecture_id { 2 }
    price { 3000 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

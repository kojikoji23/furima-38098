FactoryBot.define do
  factory :order_destination do
    zip { '123-4567' }
    prefecture_id { 4 }
    city { '新宿区' }
    address { '1-1' }
    building { '東京ハイツ' }
    tel { 12399991111 }
  end
end

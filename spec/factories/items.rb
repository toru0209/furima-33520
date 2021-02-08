FactoryBot.define do
  factory :item do
    name { 'サンプル商品' }
    description { 'サンプルの詳細' }
    category_id { 2 }
    condition_id { 2 }
    shipping_cost_id { 2 }
    shipping_place_id { 2 }
    shipping_day_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

FactoryBot.define do
  factory :item do
    name { 'サンプル商品' }
    description { 'サンプルの詳細' }
    category_id { 'カテゴリーの内容' }
    condition_id { '状態について' }
    shipping_cost_id { '発送の負担' }
    shipping_place_id { '発送場所' }
    shipping_day_id { '発送にかかる日数' }
    price { '金額' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

FactoryBot.define do
  factory :pay_form do
    user_id { 2 }
    item_id { 2 }
    postal_code { '000-0000' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    number { '青山1-1-1' }
    building { '柳ビル103' }
    phone { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

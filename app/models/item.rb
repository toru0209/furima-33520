class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_place
  belongs_to :shipping_day

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_place_id
    validates :shipping_day_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_place_id
    validates :shipping_day_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  
  validates :price, numericality: { with: /^[0-9]+$/ }
end


#   99円以下では登録できないこと
# ・10,000,000以上では登録できないこと

# ・全角文字では登録できないこと
# ・半角英数混合では登録できないこと
# ・半角英語だけでは登録できないこと
# - 販売価格は半角数字のみ保存可能であること
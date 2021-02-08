class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  KANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name, format: { with: NAME_REGEX }
    validates :last_name_kana, format: { with: KANA_REGEX }
    validates :first_name_kana, format: { with: KANA_REGEX }
    validates :birthday
  end

  has_many :items

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end

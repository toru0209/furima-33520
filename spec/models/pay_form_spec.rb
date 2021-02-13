require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @pay_form = FactoryBot.build(:pay_form, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it '全て揃っている場合に、商品購入ができること' do
        expect(@pay_form).to be_valid
      end

      it '建物名は空でも登録できること' do
        @pay_form.building = ''
        expect(@pay_form).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'user_idが必須であること' do
        @pay_form.user_id = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが必須であること' do
        @pay_form.item_id = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が必須であること' do
        @pay_form.postal_code = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に-が必須であること' do
        @pay_form.postal_code = '0000000'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が必須であること' do
        @pay_form.prefecture_id = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'Prefectureについて、ActiveHashの中身が一行目の時は登録できない' do
        @pay_form.prefecture_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が必須であること' do
        @pay_form.city = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @pay_form.number = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Number can't be blank")
      end

      it '電話番号が必須であること' do
        @pay_form.phone = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は最大11桁であること' do
        @pay_form.phone = '080000000000'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号は英数混合では登録できないこと' do
        @pay_form.phone = '0w0wwww0000'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include('Phone is invalid')
      end


      it 'トークンが空では登録できないこと' do
        @pay_form.token = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

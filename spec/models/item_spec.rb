require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it '全て揃っている場合に、商品出品ができること' do
        expect(@item).to be_valid
      end  
    end

    context '商品出品ができない時' do
      
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it '商品の説明が必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
  
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
  
      it '商品の状態についての情報が必須であること' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
  
      it '配送料の負担についての情報が必須であること' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
  
      it '発送元の地域についての情報が必須であること' do
        @item.shipping_place_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping place can't be blank")
      end
  
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
  
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it 'categoryについて、ActiveHashの中身が一行目の時は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
  
      it 'conditionについて、ActiveHashの中身が一行目の時は登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
  
      it 'shipping_costについて、ActiveHashの中身が一行目の時は登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end
  
      it 'shipping_placeについて、ActiveHashの中身が一行目の時は登録できない' do
        @item.shipping_place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping place must be other than 1')
      end
  
      it 'shipping_dayについて、ActiveHashの中身が一行目の時は登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
    

      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.name = nil
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipping_place_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping place can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      # 299円以下では登録できないこと
      it '299円以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is out of setting range')
      end


      #10,000,000以上では登録できないこと
      it '10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      #全角文字では登録できないこと
      it '全角文字では登録できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range', 'Price is not a number')
      end

      #半角英数混合では登録できないこと
      it '半角英数混合では登録できないこと' do
        @item.price = "jpy500"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range', 'Price is not a number')
      end

      #半角英語だけでは登録できないこと
      it '半角英語だけでは登録できないこと' do
        @item.price = "gohyakuen"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range', 'Price is not a number')
      end
    end
  end
end

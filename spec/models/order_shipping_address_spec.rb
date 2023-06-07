require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  
    describe '購入管理機能' do
      before do
        user = FactoryBot.create(:user)
        item = FactoryBot.create(:item)
        @order = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
      end
      context '誤った情報が入力されている場合 ' do
        it 'ユーザーIDが空では登録できないこと' do
          @order.user_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include( "User can't be blank")
        end
      
        it '郵便番号が空では登録できないこと' do
          @order.post_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Post number can't be blank")
        end
      
        it '郵便番号が「３桁-４桁」の表記でない場合は登録できないこと' do
          @order.post_number = '1234567'
          @order.valid?
          expect(@order.errors.full_messages).to include( "Post number is invalid. Include hyphen(-)")
        end
      
        it '都道府県IDが0の場合は登録できないこと ' do
          @order.prefecture_id = 0
          @order.valid?
          expect(@order.errors.full_messages).to include( "Prefecture can't be blank")
        end
      
        it '商品IDが空では登録できないこと ' do
          @order.item_id = nil
          @order.valid?
          expect(@order.errors.full_messages).to include( "Item can't be blank")
        end
      
        it 'トークンが空では登録できないこと ' do
          @order.token = ''
          @order.valid?
          expect(@order.errors.full_messages).to include( "Token can't be blank")
        end
      
        it '市区町村が空では登録できないこと ' do
          @order.city = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end
      
        it '番地が空では登録できないこと ' do
          @order.house_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("House number can't be blank")
        end
      
        it '電話番号が空では登録できないこと ' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include( "Phone number can't be blank")
        end

        it '電話番号が10桁未満の場合は登録できないこと' do
          @order.phone_number = '123456789'
          @order.valid?
          expect(@order.errors.full_messages).to include( "Phone number is invalid")
        end
        
        it '電話番号に半角数字以外が入力されている場合は登録できないこと' do
          @order.phone_number = '１２３４５６７８９０'
          @order.valid?
          expect(@order.errors.full_messages).to include( "Phone number is invalid")
        end

        it '電話番号が11桁を超える場合は登録できないこと ' do
          @order.phone_number = '123456789012'
          @order.valid?
          expect(@order.errors.full_messages).to include( "Phone number is too long (maximum is 11 characters)")
        end
      end

      context '正しい情報が入力されている場合' do
          it '正しく登録できること' do
            expect(@order).to be_valid
          end

          it '建物名が空でも登録できる' do
            @order.building_name = ''
            expect(@order).to be_valid
          end
      end
    end
end

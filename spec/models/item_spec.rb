require 'rails_helper'

RSpec.describe Item, type: :model do


  describe '商品出品機能'do
    before do
      @item = FactoryBot.build(:item)
    end
    
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'introductionが空では登録できない' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end
    
    it 'category_idが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    
    it 'item_condition_idが空では登録できない' do
      @item.item_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    
    it 'postage_payer_idが空では登録できない' do
      @item.postage_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank")
    end
    
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'preparation_day_idが空では登録できない' do
      @item.preparation_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day can't be blank")
    end
    
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'priceが半角数値でないと登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    
    it 'priceが300未満では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    
    it 'priceが9,999,999を超えると登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '正しい情報が入力されている場合、正しく登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end

require 'rails_helper'
require 'gimei'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正しい情報が入力されている場合' do
      it '正しく登録できること' do
        expect(@user).to be_valid
      end
    end

    context '誤った情報が入力されている場合' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birth_dateが空では登録できないこと' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    

      it 'passwordが英字のみの場合は登録できないこと' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが数字のみの場合は登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが5文字以下の場合は登録できないこと' do
        @user.password = 'passw'
        @user.password_confirmation = 'passw'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが全角文字を含む場合は登録できないこと' do
        @user.password = 'あpass1'
        @user.password_confirmation = 'あpass1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confimationが不一致だと登録できないこと' do
        @user.password = 'password'
        @user.password_confirmation = 'different_password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailが重複している場合は登録できないこと' do
        existing_user = FactoryBot.create(:user, email: 'existing@example.com')
        @user.email = 'existing@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailが@を含まない場合は登録できないこと' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end


      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外の文字を含む場合は登録できないこと' do
        @user.last_name = 'smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_name全角（漢字・ひらがな・カタカナ）以外の文字を含む場合は登録できないこと' do
        @user.first_name = 'john'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
    
      it 'last_name_kanaが全角（カタカナ）以外の文字を含む場合は登録できないこと' do
        @user.last_name_kana = '山田1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaが全角（カタカナ）以外の文字を含む場合は登録できないこと' do
        @user.first_name_kana = '太郎1'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end    
    
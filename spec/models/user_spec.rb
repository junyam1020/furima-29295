require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全項目存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複していたら登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@がない場合登録できないこと' do
      @user.email = '12345example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英字のみでは登録できないこと' do
      @user.password = 'example'
      @user.password_confirmation = 'example'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordに半角記号を含む場合では登録できないこと' do
      @user.password = 'ex@mp1'
      @user.password_confirmation = 'ex@mp1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordに全角を含む場合では登録できないこと' do
      @user.password = 'eｘamp1'
      @user.password_confirmation = 'eｘamp1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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

    it 'last_name_readingが空では登録できないこと' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank', 'Last name reading is invalid")
    end

    it 'first_name_readingが空では登録できないこと' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank', 'First name reading is invalid")
    end

    it 'last_nameに全角記号を含む場合登録できないこと' do
      @user.last_name = 'あ＜＞菅'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'last_nameに半角を含む場合登録できないこと' do
      @user.last_name = 'あ<1a菅'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameに全角記号を含む場合登録できないこと' do
      @user.first_name = 'あ【菅'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'first_nameに半角を含む場合登録できないこと' do
      @user.first_name = 'あ<1a菅'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_readingに半角を含む場合登録できないこと' do
      @user.last_name_reading = 'アｱﾝン'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading is invalid')
    end

    it 'last_name_readingにカタカナ以外の全角文字を含む場合登録できないこと' do
      @user.last_name_reading = 'アあ【菅ン'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading is invalid')
    end

    it 'first_name_readingに半角を含む場合登録できないこと' do
      @user.first_name_reading = 'アｱﾝン'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading is invalid')
    end

    it 'first_name_readingにカタカナ以外の全角文字を含む場合登録できないこと' do
      @user.first_name_reading = 'アあ【菅ン'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading is invalid')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

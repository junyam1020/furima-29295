require 'rails_helper'

RSpec.describe DealDestination, type: :model do
  describe '#create' do
    before do
      @deal_destination = FactoryBot.build(:deal_destination)
    end

    context '購入に成功とき' do
      it '全項目存在すれば購入できること' do
        expect(@deal_destination).to be_valid
      end

      it '建物名が空欄でも購入できること' do
        @deal_destination.building = ''
        expect(@deal_destination).to be_valid
      end
    end

    context '購入に失敗したとき' do
      it 'トークンが空の場合購入できないこと' do
        @deal_destination.token = ''
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空の場合購入できないこと' do
        @deal_destination.postal_code = ''
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号にハイフン(-)がない場合購入できないこと' do
        @deal_destination.postal_code = '1234567'
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号が[3桁-4桁]でない場合購入できないこと' do
        @deal_destination.postal_code = '12-34567'
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が0の場合購入できないこと' do
        @deal_destination.prefecture = 0
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空の場合購入できないこと' do
        @deal_destination.city = ''
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空の場合購入できないこと' do
        @deal_destination.house_number = ''
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空の場合購入できないこと' do
        @deal_destination.phone_number = ''
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上の場合購入できないこと' do
        @deal_destination.phone_number = '123456789012'
        @deal_destination.valid?
        expect(@deal_destination.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end

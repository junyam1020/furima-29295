require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全項目存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像が空の場合登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空の場合登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空の場合登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーidが0の場合登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態idが0の場合登録できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担idが0の場合登録できないこと' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送元の地域idが0の場合登録できないこと' do
      @item.shipper_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipper area can't be blank")
    end

    it '発送までの日数idが0の場合登録できないこと' do
      @item.shipment_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment date can't be blank")
    end

    it '価格が空の場合登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円未満の場合登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が10,000,000以上の場合登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end

    it '価格が全角数字を含む場合登録できないこと' do
      @item.price = '1234５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end

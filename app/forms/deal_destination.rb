class DealDestination
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture, :city, :house_number, :building, :phone_number, :deal_id, :item_id, :user_id

  with_options presence: true do
    validates :token, presence: true
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/, message: 'is invalid.' } # 電話番号は数字のみ + 桁数の指定が必要
  end

  def save
    # dealテーブルで必要なカラム名と値を渡してレコードを作成する、dela.idをdestinationのレコード作成に必要なため「deal = 」と記述
    deal = Deal.create(item_id: item_id, user_id: user_id)
    # destinationテーブルの保存に必要なカラム名と値を指定しレコードを作成
    Destination.create!(postal_code: postal_code,
                        prefecture: prefecture,
                        city: city,
                        house_number: house_number,
                        building: building,
                        phone_number: phone_number,
                        deal_id: deal.id)
  end
end

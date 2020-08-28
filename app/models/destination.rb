class Destination < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :building
  validates :phone_number, presence: true
  validates :item, presence: true

  belongs_to :deal
end

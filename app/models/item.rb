class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :shipper_area, presence: true
  validates :shipment_date, presence: true
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one :deal
end

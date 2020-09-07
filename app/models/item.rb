class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipper_area
  belongs_to_active_hash :shipment_date

  valid_number_regex = /\A[0-9]+\z/

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :shipper_area, presence: true
  validates :shipment_date, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 },
                    format: { with: valid_number_regex }
  validates :user, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :delivery_fee_id, numericality: { other_than: 0 }
  validates :shipper_area_id, numericality: { other_than: 0 }
  validates :shipment_date_id, numericality: { other_than: 0 }

  belongs_to :user
  has_one :deal
  has_one_attached :image
end

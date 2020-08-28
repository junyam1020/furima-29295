class Deal < ApplicationRecord
  validates :item, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :item
  has_one    :destination
end

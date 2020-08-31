class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  valid_password_regex = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  valid_name_regex = /\A[ぁ-んァ-ン一-龥]+\z/
  valid_katakana_regex = /\A[ァ-ン]+\z/

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }, format: { with: valid_password_regex }
  validates :last_name, presence: true, format: { with: valid_name_regex }
  validates :first_name, presence: true, format: { with: valid_name_regex }
  validates :last_name_reading, presence: true, format: { with: valid_katakana_regex }
  validates :first_name_reading, presence: true, format: { with: valid_katakana_regex }
  validates :birthday, presence: true

  has_many :items
  has_many :deals
end

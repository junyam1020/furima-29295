class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_KATAKANA_REGEX = /\A[ァ-ン]+\z/
  validates :last_name_reading, presence: true, format: { with: VALID_KATAKANA_REGEX}
  validates :first_name_reading, presence: true, format: { with: VALID_KATAKANA_REGEX}
  validates :birthday, presence: true

  has_many :items
  has_many :deals

end

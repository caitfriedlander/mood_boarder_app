class User < ActiveRecord::Base
  has_secure_password

  has_many :favorites
  has_many :favorite_boards, through: :favorites, source: :favorited, source_type: 'Board'
  has_many :boards, dependent: :destroy
  has_many :images, through: :boards

  # Verify that an email exists and that it does not already exist in the db
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
end

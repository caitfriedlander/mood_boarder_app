class Image < ActiveRecord::Base
  belongs_to :board
  has_one :user, through: :boards
end

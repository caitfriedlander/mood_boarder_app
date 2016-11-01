class Image < ActiveRecord::Base
  belongs_to :board
  belongs_to :users, through: :board
end

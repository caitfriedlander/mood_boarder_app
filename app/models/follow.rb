class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :following, polymorphic: true
end

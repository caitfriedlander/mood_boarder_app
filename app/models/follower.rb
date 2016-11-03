class Follower < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, polymorphic: true
end

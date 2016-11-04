class FollowedUsersController < ApplicationController
  before_action :set_follower

  def create
    if Follower.create(followed: @user, user: current_user)
      redirect_to @user, notice: 'User was followed!'
    else
      redirect_to @user, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Follower.where(followed_id: @user.id, user_id: current_user.id).first.destroy
    redirect_to @user, notice: 'User was unfollowed'
  end

  private

  def set_follower
    @user = User.find(params[:user_id] || params[:id])
  end
end

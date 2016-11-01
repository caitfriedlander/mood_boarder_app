class UsersController < ApplicationController
   def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @boards = @user.boards
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end


  def authorize
    if current_user.nil?
      redirect_to login_path, alert: 'Not authorized - you must be logged in!'
    end
  end

  private
    # Implement Strong Params
    def user_params
      params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
    end
end

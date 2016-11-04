class FavoriteBoardsController < ApplicationController
  before_action :set_board

  def create
    if Favorite.create(favorited: @board, user: current_user)
      redirect_to @board, notice: 'Added to favorites!'
    else
      redirect_to @board, alert: 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @board.id, user_id: current_user.id).first.destroy
    redirect_to @board, notice: 'Removed from favorites!'
  end

  def show
    @favorite = Favorite.find(params[:board_id])
    @board = Board.find(params[:id])
    @favboard = @board.id(@favorite)
  end

  private

  def set_board
    @board = Board.find(params[:board_id] || params[:id])
  end
end

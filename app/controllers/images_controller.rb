class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @board = Board.find(params[:id])
    @image = @board.images.new
    if @image.save
      redirect_to board_path @board.id
    else
      render "new"
    end
  end

  def show
    @image = Image.find(params[:id])
  end
end

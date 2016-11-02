class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @board = Board.find(params[:id])
    @image = @board.images.new(image_params)
    if @image.save
      redirect_to board_path @board.id
    else
      render "new"
    end
  end

  def show
    @image = Image.find(params[:id])
  end
private
    # Implement Strong Params
    def image_params
      params.require(:image).permit(:url, :board_id)
    end
end

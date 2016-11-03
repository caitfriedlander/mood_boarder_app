class BoardsController < ApplicationController
  # before_action :set_board, only: [:show, :edit, :update, :destroy]
  # before_action :authorize, except: [:index, :show]

  # GET /boards
  def index
    @boards = Board.all
  end

  # GET /boards/1
  def show
    @board = Board.find(params[:id])
    @favorite = Favorite.new
    @user = @board.user_id
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  def create
    # @board = Board.new(board_params)
    # @board.user_id = session[:user_id]
    @user = User.find(session[:user_id])
    @board = @user.boards.new(board_params)
    if @board.save
      redirect_to board_path @board.id
    else
      render "new"
    end
  end

  # PATCH/PUT /boards/1
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # def set_board
    #   @board = Board.find(params[:id])
    # end
    def board_params
      params.require(:board).permit(:title, :description, :user_id)
    end

end

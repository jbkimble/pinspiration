class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
    @board.user = current_user
    # binding.pry
    if @board.save
      flash[:success] = "You have successfully create the board #{@board.name}."
      redirect_to user_board_path(@board.user.slug, @board.slug)
    else
      flash[:failure] = "Board creation failed, please try again"
      redirect_to new_board_path
    end
  end


  private

  def board_params
    params.require(:board).permit(:id, :name, :private, :user_id)
  end

end

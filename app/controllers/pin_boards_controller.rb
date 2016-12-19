class PinBoardsController < ApplicationController

  def new
    if !current_user.nil?
      @pin_board = PinBoard.new(pin_id: params[:pin_id])
    else
      redirect_to login_path
    end
  end

  def create
    @pin_board = PinBoard.new(pin_board_params)
    if @pin_board.save
      flash[:success] = "#{@pin_board.pin.name} has been added to your board"
      redirect_to board_path(@pin_board.board.slug)
    else
      flash[:error] = "Please try again."
      render :new
    end
  end

  private

  def pin_board_params
    params.require(:pin_board).permit(:pin_id, :board_id)
  end

end

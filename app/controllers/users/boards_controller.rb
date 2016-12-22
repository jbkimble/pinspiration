class Users::BoardsController < ApplicationController

  def show
    @board = Board.find_by(slug: params[:board])
    @pins = @board.pins
    @sharedboard = SharedBoard.new
  end


end

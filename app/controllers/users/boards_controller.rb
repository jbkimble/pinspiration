class Users::BoardsController < ApplicationController

  def show
    # binding.pry
    @board = Board.find_by(slug: params[:board])
    @pins = @board.pins
  end


end

class Users::BoardsController < ApplicationController

  def index
    @board = Board.find(params[:slug])
  end
  def show
    @board = Board.find(params[:slug])
  end

end

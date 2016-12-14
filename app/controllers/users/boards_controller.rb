class BoardsController < ApplicationController

  def index
    # @user = 
    @board = Board.find(params[:slug])
  end

end

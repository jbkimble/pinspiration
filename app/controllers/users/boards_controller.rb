class Users::BoardsController < ApplicationController

  def show
    @board = Board.find_by(slug: params[:board])
  end

end

class SharedBoardsController < ApplicationController

  def create
    if User.find_by(username: params[:viewer])
      viewer = User.find_by(username: params[:viewer])
      board = Board.find(params[:board_id])
      SharedBoard.create(owner_id:current_user.id, viewer_id:viewer.id, board_id:board.id)
    end
    flash[:warning] = "It works"
    redirect_to(show_user_path(current_user.slug))
  end
end

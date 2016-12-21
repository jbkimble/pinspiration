class Admin::BoardsController < Admin::BaseController

  def destroy
    @board = Board.find(params[:id])
    @board.delete
    flash[:success] = "Board has been deleted"
    redirect_to admin_users_path
  end

end

class Admin::CommentsController < Admin::BaseController

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    flash[:success] = "Comment has been deleted"
    redirect_to admin_users_path
  end

end

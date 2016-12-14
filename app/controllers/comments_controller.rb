class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to comments_path
      flash[:success] = "Your comment has been saved."
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end

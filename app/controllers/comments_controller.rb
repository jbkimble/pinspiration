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
      flash[:success] = "Your comment has been saved."
      redirect_to pin_path(@comment.pin)
    else
      flash.now[:error] = "Please try again."
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash.now[:success] = "Your comment has been updated."
    else
      flash.now[:error] = "Please try again."
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    flash[:success] = "Your comment has been deleted."
    redirect_to pin_path(@comment.pin)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :pin_id)
  end

end

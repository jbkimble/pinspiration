class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    #@item = Item.find(params[:id])
    #@comments = Faraday.get(/api/v1/comments?item_id=1)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      @comment.create_activity :create, owner: current_user
      flash[:success] = "Your comment has been saved."
      redirect_to pin_path(@comment.pin)
    else
      flash.now[:error] = "Please try again."
      render :new
    end
    #@comment = Faraday.post(data from form)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = "Your comment has been updated."
      redirect_to pin_path(@comment.pin)
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

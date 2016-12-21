class Api::V1::CommentsController < ApiController
  include ActionController::MimeResponds
  #respond_to :json, :xml

  def index
    render json: Pin.find(params[:pin_id]).comments
  end

  def create
    pin = Pin.find(params[:pin_id])
    comment = pin.comments.new(comment_params)
    comment.user = User.find_by(api_key: params[:api_key])

    respond_to do |format|
      if comment.save
        # format.html { redirect_to comment }
        format.json {render json: comment }
        # format.json { render action: 'show', status: :created, location: @comment }
      else
        # format.html { render action: 'new' }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.user = User.find_by(api_key: params[:api_key])
    if comment.update(comment_params)
      # format.html { redirect_to comment }
      render json: comment
      # format.json {render json: comment }
      # format.json { render action: 'show', status: :created, location: @comment }
    # else
      # format.html { render action: 'new' }
      # format.json { render json: comment.errors, status: :unprocessable_entity }

    end
  end

  # def create
  #   pin = Pin.find(params[:pin_id])
  #   comment = pin.comments.new(comment_params)
  #   comment.user = User.find_by(api_key: params[:api_key])
  #
  #   respond_to do |format|
  #     if comment.save
  #       format.html { redirect_to comment, flash[:success] = "Your comment was created" }
  #       format.json {render json: comment }
  #     else
  #       format.html { render action: 'new', flash[:danger] = "Your comment was updated" }
  #       format.json { render json: comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def update
  #   comment = Comment.find(params[:id])
  #   comment.user = User.find_by(api_key: params[:api_key])
  #   respond_to do |format|
  #     if comment.update(comment_params)
  #       format.html { redirect_to comment, flash[:success] = "Your comment was updated" }
  #       format.json {render json: comment }
  #     else
  #       format.html { render action: 'new', flash[:danger] = "Your comment was not updated" }
  #       format.json { render json: comment.errors, status: :unprocessable_entity }
  #   end
  #   end
  # end

  def destroy
        comments = Comment.all
    comment = Comment.find(params[:id])
    if comment.user = User.find_by(api_key: params[:api_key])
      comment.delete
      render json: comments
    else
      format.json { render json: comment.errors, status: :unprocessable_entity }
    end
  end
end

private

def comment_params
  params.require(:comment).permit(:id, :content, :user_id, :created_at, :updated_at, :pin_id)
end

class Api::V1::Pins::CommentsController < RequestController
  include ActionController::MimeResponds

  def index
    render json: Pin.find(params[:id]).comments
  end

  def create
    pin = Pin.find(params[:id])
    comment = pin.comments.new(comment_params)
    comment.user = User.find_by(api_key: params[:api_key])
    # need a way to find the user - API key

    respond_to do |format|
      if comment.save
        # format.html { redirect_to comment }
        format.json {render json: pin.comments }
        # format.json { render action: 'show', status: :created, location: @comment }
      else
        # format.html { render action: 'new' }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content, :user_id, :created_at, :updated_at, :pin_id)
  end
end

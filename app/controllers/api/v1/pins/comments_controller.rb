class Api::V1::Pins::CommentsController < RequestController
  def index
    render json: Pin.find(params[:id]).comments
  end

  def create
    @pin = Pin.find(params[:id])
    @comment = @pin.comments.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment }
        # format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

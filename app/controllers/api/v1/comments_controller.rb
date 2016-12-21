class Api::V1::CommentsController < RequestController
  include ActionController::MimeResponds

  def update
    comment = Comment.find(params[:id])
    #check for user to match user w/api key
    if comment.update(comment_params)
      # format.html { redirect_to comment }
      format.json {render json: comment }
      # format.json { render action: 'show', status: :created, location: @comment }
    else
      # format.html { render action: 'new' }
      format.json { render json: comment.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    #check for user to match user w/api key
    comment.delete
  end
end

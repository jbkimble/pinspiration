class Api::V1::Pins::CommentsController < RequestController
  def index
    render json: Pin.find(params[:id]).comments
  end
end

class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
    @comment = Comment.new(pin_id: @pin.id)
  end

  def new
    if !current_user.nil? && (current_user.registered? || current_user.admin?)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

end

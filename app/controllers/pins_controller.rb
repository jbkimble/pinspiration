class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
    @comment = Comment.new(pin_id: @pin.id)
  end

end

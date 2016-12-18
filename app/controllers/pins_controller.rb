class PinsController < ApplicationController

  def index
    @pins = Pin.all_pins_chronologically_by_updated_at
  end

  def show
    @pin = Pin.find(params[:id])
    @comment = Comment.new(pin_id: @pin.id)
  end

end

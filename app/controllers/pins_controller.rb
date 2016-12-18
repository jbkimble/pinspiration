class PinsController < ApplicationController

  def index
    @pins = Pin.order_pins
  end

  def show
    @pin = Pin.find(params[:id])
  end

end

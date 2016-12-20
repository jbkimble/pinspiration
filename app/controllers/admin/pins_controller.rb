class Admin::PinsController < Admin::BaseController

  def index
    @pins = Pin.all_pins_chronologically_by_updated_at
  end

  def show
    @pin = Pin.find(params[:id])
    @comment = Comment.new(pin_id: @pin.id)
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.delete
    flash[:success] = "Pin has been deleted"
    redirect_to admin_pins_path
  end

end

class PinBoardsController < ApplicationController

  def new
    if !current_user.nil?
      @pin = Pin.new() #this needs more work; figure out how to pass in an existing pin's information
    else
      redirect_to login_path
    end
  end

end

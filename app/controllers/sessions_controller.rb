class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in as #{@user.name}!"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Login failed, please try again."
      render :new
    end
  end
end

class UsersController < ApplicationController
  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #@user.roles << Role.find(2)
      flash[:success] = "Welcome #{@user.name}"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:failure] = "Account creation failed, please try again"
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "You account was successfully updated"
      redirect_to profile_path
    else
      flash[:failure] = "Your account failed to update"
      redirect_to profile_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :username, :password, :phone, :avatar)
    end
end

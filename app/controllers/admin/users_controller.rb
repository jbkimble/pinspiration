class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = "User has been disabled"
      redirect_to admin_user_path(@user)
    else
      flash[:failure] = "User failed to update"
    end
  end

  private

  def user_params
    params.require(:user).permit(:status, :id)
  end

end

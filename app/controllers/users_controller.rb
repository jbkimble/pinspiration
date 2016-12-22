class UsersController < ApplicationController


  def show
    # viewed_user = User.find_by(slug: params[:user])
    # @user = UserPresenter.new(current_user, viewed_user)
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_ids)

    if @user = User.find_by(slug: params[:user])
      @user.set_private_boards(current_user)
    else
      flash[:failure] = "This user does not exist"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.api_key = ApiKeyGenerator.new_key
    if @user.save
      @user.roles << Role.find_by(name: "user")
      flash[:success] = "Welcome #{@user.name}"
      session[:user_id] = @user.id
      redirect_to root_path
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
      params.require(:user).permit(:id, :name, :email, :username, :password, :phone, :avatar)
    end
end

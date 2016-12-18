class Users::FollowingController < ApplicationController

  def index
    @user = User.find(params[:user])
    @following = @user.following
  end
  
end

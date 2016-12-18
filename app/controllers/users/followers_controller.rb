class Users::FollowersController < ApplicationController
  def index
    @user = User.find(params[:user])
    @followers = @user.followers

  end
end

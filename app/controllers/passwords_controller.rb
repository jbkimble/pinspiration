class PasswordsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
      send_confirmation_to(user)
      @user = User.new
    else
      # error ere plz
    end
  end

  def update
    user = User.find_by(verification_code: params[:user][:verification_code])
    if user
      user.update(user_params.merge(verification_code: nil))
      flash[:success] = "Password succesfully reset"
      redirect_to login_path
    else
      flash[:alert] = "Verification code not found"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def generate
    rand(100000...999999).to_s
  end

  def send_code(phone_number, code)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: phone_number,
      body: code
    )
  end

  def send_confirmation_to(user)
    verification_code = generate
    user.update(verification_code: verification_code)
    send_code(user.phone, verification_code)
  end

end

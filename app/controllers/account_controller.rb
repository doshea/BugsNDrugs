class AccountController < ApplicationController
  before_filter :ensure_logged_in, only: [:show, :update, :change_password]

  def show
  end

  def update
    @current_user.update_attributes(profile_params)
    redirect_to account_path
  end

  def change_password
    if @current_user.authenticate(params[:old_password])
      @current_user.update_attributes(password_params)
    end
    redirect_to account_path
  end

  ### Do not require login
  def forgot
  end

  def forgot_username
    @user = User.find_by_email(params[:email])
    if @user
      ForgottenMailer.username(@user).deliver_now
      alert_js("We just sent an email to you with your username! It may take seconds to minutes to arrive, depending on your email provider.")
    else
      alert_js('No such user found :-(')
    end
  end

  def forgot_password
    @user = User.find_by_email(params[:username_or_email]) || User.find_by_username(params[:username_or_email])
    if @user
      ForgottenMailer.password(@user).deliver_now
      alert_js("We just sent an email to reset your password! It may take seconds to minutes to arrive, depending on your email provider.")
    else
      alert_js('No such user found :-(')
    end
  end

  def reset_password
    @user = User.where('password_reset_sent_at > ?', 1.days.ago).find_by(password_reset_token: params[:password_reset_token])
  end

  private ###
  def profile_params
    params.require(:user).permit(:first_name, :last_name, :image, :remote_image_url)
  end
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
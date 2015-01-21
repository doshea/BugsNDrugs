class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)
    if @user.save
      session[:user_id] = @user.id unless session[:user_id]
      #verification email
      UserMailer.verification(@user).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  def reset_password
    @user = User.find_by_password_reset_token(params[:password_reset_token])
    if @user
      if params[:new_password] == params[:new_password_confirmation]
        @user.update_attributes(password: params[:new_password], password_confirmation: params[:new_password_confirmation])
        cookies[:auth_token] = @user.auth_token
        redirect_to root_path
      else
        alert_js('Sorry, those passwords do not match.')
      end
    else
      render text: 'Invalid reset token'
    end
  end

  private ###
  def signup_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

end
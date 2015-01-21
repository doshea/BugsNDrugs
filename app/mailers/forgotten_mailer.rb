class ForgottenMailer < ApplicationMailer

  def password(user)
    @user = user
    mail(to: @user.named_email_address, subject: "Reset your BugsNDrugs password")
  end

  def username(user)
    @user = user
    mail(to: @user.named_email_address, subject: "Forgot your username?")
  end

end
class UserMailer < ApplicationMailer

  def test_email(user)
    @user = user
    mail(to: @user.named_email_address, subject: "Welcome to BugsNDrugs")
  end

  def welcome_email(user)
    @user = user
    mail(to: @user.named_email_address, subject: "Welcome to BugsNDrugs!")
  end

end
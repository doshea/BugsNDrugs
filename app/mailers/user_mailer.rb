class UserMailer < ApplicationMailer

  def test_email(user)
    @user = user
    mail(to: @user.named_email_address, subject: "Welcome to BugsNDrugs")
  end

  def verification(user)
    @user = user
    mail(to: @user.named_email_address, subject: "Verify your BugsNDrugs email address")
  end

end
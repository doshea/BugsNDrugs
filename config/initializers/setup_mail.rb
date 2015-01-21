ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_USERNAME'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => ENV['MAILGUN_SMTP_DOMAIN'],
}
ActionMailer::Base.delivery_method = :smtp
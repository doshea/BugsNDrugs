class ApplicationMailer < ActionMailer::Base
  layout 'default_mail'
  
  full_sender = "BugsNDrugs <info@bugsndrugs.herokuapp.com>"
  default from: full_sender

end
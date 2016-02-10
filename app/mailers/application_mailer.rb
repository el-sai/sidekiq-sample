class ApplicationMailer < ActionMailer::Base
  default from: "from@blog.com"
  layout 'mailer'
end

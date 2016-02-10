class SampleMailer < ApplicationMailer

	def send_email(post)
    @post = post
    mail(to: 'jayanth@addvalsolutions.com', subject: 'Testing background job')
  end
end

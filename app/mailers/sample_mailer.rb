class SampleMailer < ApplicationMailer

	def send_email(post_id)
    @post = Post.find_by_id(post_id)
    mail(to: 'jayanth@addvalsolutions.com', subject: 'Testing background job') if @post
  end
end

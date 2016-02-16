require "rails_helper"

RSpec.describe SampleMailer, :type => :mailer do

	let(:post) { FactoryGirl.create(:post) }

  describe "send_email" do
    let(:mail) { SampleMailer.send_email(post.id).deliver_now }

    it "renders the headers" do
      expect(mail.subject).to eq("Testing background job")
      expect(mail.to).to eq(["jayanth@addvalsolutions.com"])
      expect(mail.from).to eq(["from@blog.com"])
    end

    it "assigns @post" do
      expect(mail.body.encoded).to match(post.title)
      expect(mail.body.encoded).to match(post.body)
    end
  end
	
	it 'should enqueue and delay the mailer job' do
		SampleMailer.delay.send_email(post.id) # Enqueuing the mailer
		expect(Sidekiq::Extensions::DelayedMailer.jobs.size == 1).to be true
		expect(SampleMailer.instance_method :send_email).to be_delayed(post.id)
	end

	it 'should delay the mailer job for specified time' do
		SampleMailer.delay_for(1.minute).send_email(post.id) # Enqueuing the mailer
		expect(SampleMailer.instance_method :send_email).to be_delayed(post.id).for 1.minute
	end
end
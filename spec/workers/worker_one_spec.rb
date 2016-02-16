require "rails_helper"

RSpec.describe WorkerOne, :type => :worker do

	it { is_expected.to be_processed_in :critical }
  it { is_expected.to be_retryable true }
  it { is_expected.to save_backtrace 10 }

 	it 'should enqueue the job' do
		WorkerOne.perform_async # Enqueuing the job
		expect(WorkerOne).to have_enqueued_job
	end
end
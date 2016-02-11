class WorkerOne
  include Sidekiq::Worker
  sidekiq_options :queue => :critical

  def perform
  	7.times { puts "\t*\n" }
  	# puts "Worker ONE executing"
  end
end
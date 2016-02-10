class WorkerOne
  include Sidekiq::Worker
  sidekiq_options :queue => :critical

  def perform
  	puts "Worker ONE executing"
  end
end
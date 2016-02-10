class WorkerTwo
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform
  	puts "Worker TWO executing"
  end
end
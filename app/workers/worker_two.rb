class WorkerTwo
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform
  	print "\t***\n\t  *\n\t  *\n\t***\n\t*\n\t*\n\t***"
  	# puts "Worker TWO executing"
  end
end
task :enqueue_jobs => :environment do
	count = 1
	50.times do
		if (count % 2 != 0)
			WorkerOne.perform_async()
		else
			WorkerTwo.perform_async()
		end
		count += 1
	end
end
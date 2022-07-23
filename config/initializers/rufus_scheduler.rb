unless Rails.env.test?
  scheduler = Rufus::Scheduler.new

  scheduler.every '10s' do
    MiningJob.perform_now
  end

  scheduler.join
end

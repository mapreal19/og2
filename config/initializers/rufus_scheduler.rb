unless Rails.env.test?
  Rails.configuration.after_initialize do
    require 'rufus-scheduler'

    s = Rufus::Scheduler.singleton

    s.every '10s' do
      User.mine_resources
    end
  end
end

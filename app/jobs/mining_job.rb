class MiningJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      user.iron += 100
      user.copper += 30
      user.gold += 10.0 / 60.0
      user.save!
    end
  end
end

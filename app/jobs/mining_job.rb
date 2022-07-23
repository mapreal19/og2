class MiningJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.iron += 10
    user.copper += 3
    user.gold += 1.0 / 60.0
    user.save!
  end
end

class MiningJob < ApplicationJob
  queue_as :default

  SECONDS_JOB_FRECUENCY = 10

  def perform
    User.find_each do |user|
      user.iron += user.iron_rate * SECONDS_JOB_FRECUENCY
      user.copper += user.copper_rate * SECONDS_JOB_FRECUENCY
      user.gold += user.gold_rate * SECONDS_JOB_FRECUENCY
      user.save!
    end
  end
end

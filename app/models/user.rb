# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :iron_level, :copper_level, :gold_level, numericality: { in: 1..5 }

  def self.mine_resources
    MiningJob.perform_now
  end
end

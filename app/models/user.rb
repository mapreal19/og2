# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :iron_level, :copper_level, :gold_level, numericality: { in: 1..5 }

  def self.mine_resources
    MiningJob.perform_later
  end

  def iron_rate
    {
      1 => 10,
      2 => 20,
      3 => 40,
      4 => 80,
      5 => 150
    }[iron_level]
  end

  def copper_rate
    {
      1 => 3,
      2 => 7,
      3 => 14,
      4 => 30,
      5 => 60
    }[copper_level]
  end

  def gold_rate
    {
      1 => 2 / 60.0,
      2 => 3 / 60.0,
      3 => 4 / 60.0,
      4 => 6 / 60.0,
      5 => 8 / 60.0
    }[gold_level]
  end
end

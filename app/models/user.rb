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

  def iron_upgrade_cost
    {
      1 => { iron: 300, copper: 100, gold: 1 },
      2 => { iron: 800, copper: 250, gold: 2 },
      3 => { iron: 1600, copper: 500, gold: 4 },
      4 => { iron: 3000, copper: 1000, gold: 8 },
      5 => nil
    }[iron_level]
  end

  def copper_upgrade_cost
    {
      1 => { iron: 200, copper: 70 },
      2 => { iron: 400, copper: 150 },
      3 => { iron: 800, copper: 300 },
      4 => { iron: 1600, copper: 600 },
      5 => nil
    }[copper_level]
  end

  def gold_upgrade_cost
    {
      1 => { copper: 100, gold: 2 },
      2 => { copper: 200, gold: 4 },
      3 => { copper: 400, gold: 8 },
      4 => { copper: 800, gold: 16 },
      5 => nil
    }[gold_level]
  end

  def can_upgrade_iron?
    cost = iron_upgrade_cost

    iron >= cost[:iron] && copper >= cost[:copper] && gold >= cost[:gold]
  end

  def upgrade_iron
    return unless can_upgrade_iron?

    cost = iron_upgrade_cost

    update!(
      iron_level: iron_level + 1,
      iron: iron - cost[:iron],
      copper: copper - cost[:copper],
      gold: gold - cost[:gold]
    )
  end
end

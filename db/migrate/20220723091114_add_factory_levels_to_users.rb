class AddFactoryLevelsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :iron_level, :integer, default: 1
    add_column :users, :copper_level, :integer, default: 1
    add_column :users, :gold_level, :integer, default: 1
  end
end

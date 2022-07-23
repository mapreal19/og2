class AddResourcesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :iron, :decimal, default: 0.0
    add_column :users, :copper, :decimal, default: 0.0
    add_column :users, :gold, :decimal, default: 0.0
  end
end

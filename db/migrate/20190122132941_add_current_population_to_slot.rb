class AddCurrentPopulationToSlot < ActiveRecord::Migration[5.2]
  def change
    add_column :slots, :currentPopulation, :integer, :default => 0
  end
end

class AddNameToSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :slots, :name, :string
  end
end

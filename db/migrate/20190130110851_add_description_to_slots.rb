class AddDescriptionToSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :slots, :description, :string
  end
end

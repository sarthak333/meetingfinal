class AddSlotToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slot_id, :integer
  end
end

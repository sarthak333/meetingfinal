class AddSlotIdToSrecords < ActiveRecord::Migration[5.2]
  def change
    add_column :srecords, :slot_id, :integer
  end
end

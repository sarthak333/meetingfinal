class AddRoomsToSlots < ActiveRecord::Migration[5.2]
  def change
    add_reference :slots, :room, foreign_key: true
  end
end

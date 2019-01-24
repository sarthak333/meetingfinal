class CreateSrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :srecords do |t|
      t.integer :slot_id
      t.integer :user_id

      t.timestamps
    end
  end
end

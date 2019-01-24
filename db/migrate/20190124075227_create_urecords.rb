class CreateUrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :urecords do |t|
      t.integer :user_id
      t.integer :slot_id

      t.timestamps
    end
  end
end

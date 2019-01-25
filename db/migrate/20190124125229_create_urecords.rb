class CreateUrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :urecords do |t|
      t.integer :slot_id
      t.string :status, default: "Not Yet Responded"

      t.timestamps
    end
  end
end

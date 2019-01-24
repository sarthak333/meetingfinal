class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.time :start
      t.time :stop
      t.integer :people

      t.timestamps
    end
  end
end

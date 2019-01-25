class CreateSrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :srecords do |t|
      t.integer :user_id
      t.string :status, default: "Uncomfirmed"

      t.timestamps
    end
  end
end

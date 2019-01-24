class AddStatusToUrecords < ActiveRecord::Migration[5.2]
  def change
    add_column :urecords, :status, :string, default: "Not Responded"
  end
end

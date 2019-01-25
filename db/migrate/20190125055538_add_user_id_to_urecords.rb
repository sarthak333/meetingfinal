class AddUserIdToUrecords < ActiveRecord::Migration[5.2]
  def change
    add_column :urecords, :user_id, :integer
  end
end

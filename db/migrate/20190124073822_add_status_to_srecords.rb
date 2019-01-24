class AddStatusToSrecords < ActiveRecord::Migration[5.2]
  def change
    add_column :srecords, :status, :string, default: "Unconfirm"
  end
end

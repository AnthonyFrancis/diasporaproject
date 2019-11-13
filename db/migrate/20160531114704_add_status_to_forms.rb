class AddStatusToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :status, :string
  end
end

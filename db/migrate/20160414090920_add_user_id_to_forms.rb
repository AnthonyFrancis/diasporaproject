class AddUserIdToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :user_id, :integer
    add_index :forms, :user_id
  end
end

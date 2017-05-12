class AddStatusToForms < ActiveRecord::Migration
  def change
    add_column :forms, :status, :string
  end
end

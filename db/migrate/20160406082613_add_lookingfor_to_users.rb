class AddLookingforToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lookingfor, :string
  end
end

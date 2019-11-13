class AddUserIdToSyndicates < ActiveRecord::Migration[5.2]
  def change
    add_column :syndicates, :user_id, :integer
    add_index :syndicates, :user_id
  end
end

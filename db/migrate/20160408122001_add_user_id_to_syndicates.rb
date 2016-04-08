class AddUserIdToSyndicates < ActiveRecord::Migration
  def change
    add_column :syndicates, :user_id, :integer
    add_index :syndicates, :user_id
  end
end

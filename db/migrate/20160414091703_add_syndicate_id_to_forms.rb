class AddSyndicateIdToForms < ActiveRecord::Migration
  def change
    add_column :forms, :syndicate_id, :integer
    add_index :forms, :syndicate_id
  end
end

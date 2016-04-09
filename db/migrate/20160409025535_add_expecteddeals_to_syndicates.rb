class AddExpecteddealsToSyndicates < ActiveRecord::Migration
  def change
    add_column :syndicates, :expecteddeals, :string
  end
end

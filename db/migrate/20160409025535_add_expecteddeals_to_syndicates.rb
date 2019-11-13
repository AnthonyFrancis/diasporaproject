class AddExpecteddealsToSyndicates < ActiveRecord::Migration[5.2]
  def change
    add_column :syndicates, :expecteddeals, :string
  end
end

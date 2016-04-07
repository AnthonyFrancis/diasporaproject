class AddInvestorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :investor, :boolean
  end
end

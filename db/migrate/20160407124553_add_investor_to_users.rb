class AddInvestorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :investor, :boolean
  end
end

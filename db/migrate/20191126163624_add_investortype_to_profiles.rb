class AddInvestortypeToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :investor_type, :string
  end
end

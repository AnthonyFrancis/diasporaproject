class AddMaxinvestToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :maxinvest, :string
  end
end

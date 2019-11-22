class AddAngelurlToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :angelurl, :string
  end
end

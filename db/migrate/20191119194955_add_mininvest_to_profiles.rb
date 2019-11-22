class AddMininvestToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :mininvest, :string
  end
end

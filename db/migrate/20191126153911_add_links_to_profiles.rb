class AddLinksToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :twitter_url, :string
    add_column :profiles, :linkedin_url, :string
    add_column :profiles, :angellist_url, :string
    add_column :profiles, :website_url, :string
  end
end

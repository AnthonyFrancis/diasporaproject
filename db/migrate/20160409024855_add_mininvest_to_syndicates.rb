class AddMininvestToSyndicates < ActiveRecord::Migration[5.2]
  def change
    add_column :syndicates, :mininvest, :string
  end
end

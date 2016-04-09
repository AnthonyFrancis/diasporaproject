class AddMininvestToSyndicates < ActiveRecord::Migration
  def change
    add_column :syndicates, :mininvest, :string
  end
end

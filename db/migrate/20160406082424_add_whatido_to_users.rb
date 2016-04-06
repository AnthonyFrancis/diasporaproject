class AddWhatidoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :whatido, :string
  end
end

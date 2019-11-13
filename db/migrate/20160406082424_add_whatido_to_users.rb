class AddWhatidoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :whatido, :string
  end
end

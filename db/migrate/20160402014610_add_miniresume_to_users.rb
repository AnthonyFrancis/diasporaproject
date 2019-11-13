class AddMiniresumeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :miniresume, :string
  end
end

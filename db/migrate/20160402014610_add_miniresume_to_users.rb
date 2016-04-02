class AddMiniresumeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :miniresume, :string
  end
end

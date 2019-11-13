class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :investment_pledge

      t.timestamps null: false
    end
  end
end

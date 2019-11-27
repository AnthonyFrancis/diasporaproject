class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :location
      t.string :role
      t.decimal :min_invest
      t.decimal :max_invest

      t.timestamps
    end
  end
end

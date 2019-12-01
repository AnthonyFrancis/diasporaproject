class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :amount
      t.string :description
      t.text :features,  array: true, default: []
      t.string :interval
      t.string :interval_count
      t.string :stripe_id

      t.timestamps
    end
  end
end

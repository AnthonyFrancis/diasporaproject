class AddInitialinvestmentToSyndicate < ActiveRecord::Migration[5.2]
  def change
    add_column :syndicates, :initial_investment, :string
  end
end

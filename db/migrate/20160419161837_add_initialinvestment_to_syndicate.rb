class AddInitialinvestmentToSyndicate < ActiveRecord::Migration
  def change
    add_column :syndicates, :initial_investment, :string
  end
end

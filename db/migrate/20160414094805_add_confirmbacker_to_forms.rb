class AddConfirmbackerToForms < ActiveRecord::Migration
  def change
    add_column :forms, :confirm_backer, :boolean
  end
end

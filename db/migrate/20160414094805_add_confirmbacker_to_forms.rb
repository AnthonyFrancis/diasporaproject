class AddConfirmbackerToForms < ActiveRecord::Migration
  def change
    add_column :forms, :confirm_backer, :boolean, default: 0
  end
end

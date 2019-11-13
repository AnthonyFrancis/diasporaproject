class AddConfirmbackerToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :confirm_backer, :boolean, default: false
  end
end

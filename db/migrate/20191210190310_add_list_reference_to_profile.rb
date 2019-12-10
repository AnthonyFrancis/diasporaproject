class AddListReferenceToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :list, foreign_key: true
  end
end

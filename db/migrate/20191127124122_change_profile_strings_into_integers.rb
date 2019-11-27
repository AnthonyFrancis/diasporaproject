class ChangeProfileStringsIntoIntegers < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :mininvest, 'decimal USING CAST(mininvest AS decimal)'
    change_column :profiles, :maxinvest, 'decimal USING CAST(maxinvest AS decimal)'
  end
end

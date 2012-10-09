class RenameTypeToCategoryMoney < ActiveRecord::Migration
  def up
    rename_column :money, :type, :category
  end

  def down
    rename_column :money, :category, :type
  end
end

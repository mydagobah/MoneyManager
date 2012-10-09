class AddMonthToMoney < ActiveRecord::Migration
  def change
    add_column :money, :month, :string
  end
end

class AddYearToMoney < ActiveRecord::Migration
  def change
    add_column :money, :year, :string
  end
end

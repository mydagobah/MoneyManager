class AddTypeToMoney < ActiveRecord::Migration
  def change
    add_column :money, :type, :string
  end
end

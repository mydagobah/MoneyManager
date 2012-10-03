class AddIndexToMoneyUserIdCreatedAt < ActiveRecord::Migration
  def change
    add_index :money, [:user_id, :created_at]
  end
end

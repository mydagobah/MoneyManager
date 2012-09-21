class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.float :value
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end

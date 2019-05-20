class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :product_id
      t.decimal :subtotal, precision: 9, scale: 2
      t.decimal :tax, precision: 9, scale: 2
      t.decimal :total, precision: 9, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end

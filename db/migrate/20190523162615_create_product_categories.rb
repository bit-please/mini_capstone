class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.integer :category_id
      t.integer :product_id

      t.timestamps
    end
  end
end

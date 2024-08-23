class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :name , null: false
      t.text :description, null: false
      t.float :stock, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end

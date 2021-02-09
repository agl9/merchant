class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCartItem < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart
      t.references :variant
      t.integer :count

      t.timestamps
    end
  end
end

class CreateStockItem < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_items do |t|
      t.references :stock_location

      t.integer :count
      t.timestamps
    end
  end
end

class CreateVariant < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.references :product
      t.string :sku

      t.timestamps
    end
  end
end

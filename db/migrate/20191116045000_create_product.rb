class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :brand
      t.references :category

      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

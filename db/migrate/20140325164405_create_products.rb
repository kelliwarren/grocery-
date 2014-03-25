class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 2
      t.integer :quantity, default: 0 
      t.string :image
      t.belongs_to :store

      t.timestamps
    end
  end
end

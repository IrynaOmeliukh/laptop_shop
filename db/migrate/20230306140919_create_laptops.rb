class CreateLaptops < ActiveRecord::Migration[7.0]
  def change
    create_table :laptops do |t|
      t.string :company
      t.string :model
      t.integer :year
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end

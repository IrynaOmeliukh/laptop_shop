class AddLikeToLaptops < ActiveRecord::Migration[7.0]
  def change
    add_column :laptops, :like, :boolean, default: false
  end
end

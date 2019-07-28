class RemoveQuantityIdInCartedProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carted_products, :quantity_id, :integer
    add_column :carted_products, :quantity, :integer
  end
end

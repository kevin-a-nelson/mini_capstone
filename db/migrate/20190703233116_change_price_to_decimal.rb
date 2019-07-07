class ChangePriceToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, precision: 5, scale: 0
  end
end
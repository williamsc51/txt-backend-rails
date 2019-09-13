class ChangeCartsTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :carts, :cart
  end
end

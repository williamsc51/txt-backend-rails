class ChangeCartItemTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :cart_items, :books_carts
  end
end

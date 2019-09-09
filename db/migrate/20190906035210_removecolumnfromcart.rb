class Removecolumnfromcart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :book_id, :user_id
  end
end

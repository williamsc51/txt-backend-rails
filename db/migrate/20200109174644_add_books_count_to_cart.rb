class AddBooksCountToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :books_count, :integer, default: 0, null: false
  end
end

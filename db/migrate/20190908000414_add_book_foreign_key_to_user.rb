class AddBookForeignKeyToUser < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :books, :users
  end
end

class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, limit: 80
      t.string :author, null: false, limit: 50
      t.integer :isbn
      t.float :price, null: false
      t.string :description, limit: 150
      t.string :condition
      t.string :cover
      t.string :category
      t.references :user
      t.timestamps

      t.index :title
      t.index :author
      t.index :isbn
    end
  end
end

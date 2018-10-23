class CreateCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :covers do |t|
      t.string :cover

      t.timestamps
    end
  end
end

class CreateCovers < ActiveRecord::Migration[5.1]
  def up
     create_table :covers do |t|
      t.string :cover, null: true 
      t.timestamps
    end

    def down
      drop_table :covers
    end

end

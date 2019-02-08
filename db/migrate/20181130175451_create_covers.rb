class CreateCovers < ActiveRecord::Migration[5.1]
 
  def change
     create_table :covers do |t|
      t.string :cover, null: true 
      t.timestamps
    end
  end

  # def down
  #     drop_table :covers
  # end

end

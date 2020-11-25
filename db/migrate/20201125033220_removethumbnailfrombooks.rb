class Removethumbnailfrombooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :thumbnail
  end
end

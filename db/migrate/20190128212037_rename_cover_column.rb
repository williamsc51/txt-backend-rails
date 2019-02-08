class RenameCoverColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :cover, :thumbnail
  end
end

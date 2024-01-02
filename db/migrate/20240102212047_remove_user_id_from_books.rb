class RemoveUserIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :user_id
  end
end

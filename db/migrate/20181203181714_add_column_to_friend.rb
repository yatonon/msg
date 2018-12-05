class AddColumnToFriend < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :to_id, :int
  end
end

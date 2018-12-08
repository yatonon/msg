class AddNameAndUserOriginalToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :user_original, :string
  end
end

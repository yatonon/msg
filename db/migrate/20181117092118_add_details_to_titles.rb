class AddDetailsToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :roomname, :string
  end
end

class CreateChannelmessages < ActiveRecord::Migration[5.2]
  def change
    create_table :channelmessages do |t|
      t.text :content
      t.integer :from_id
      t.integer :to_id
      t.integer :room_id
      t.references :room, foreign_key: { to_table: :channels }
      t.timestamps
    end
  end
end

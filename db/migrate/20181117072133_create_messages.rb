class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :from, foreignkey: {to_table: :users }
      t.references :to, foreignkey: {to_table: :users }
      # t.references :room, foreignkey: {to_table: :users }

      t.timestamps
    end
  end
end

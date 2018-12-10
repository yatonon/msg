class CreateImgPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :img_posts do |t|
      t.string :image
      t.references :user

      t.timestamps
    end
  end
end

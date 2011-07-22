class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :content
      t.references :post
      t.references :fred

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :post_id
    add_index :posts, :fred_id
  end
end

class CreateFreds < ActiveRecord::Migration
  def change
    create_table :freds do |t|
      t.string :headline
      t.text :content
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :freds, :category_id
    add_index :freds, :user_id
  end
end

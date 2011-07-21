class CreateFreds < ActiveRecord::Migration
  def change
    create_table :freds do |t|
      t.string :headline
      t.references :category

      t.timestamps
    end
    add_index :freds, :category_id
  end
end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :category

      t.timestamps
    end
    add_index :categories, :category_id
  end
end

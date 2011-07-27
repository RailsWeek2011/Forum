class AddAliveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alive, :boolean
  end
end
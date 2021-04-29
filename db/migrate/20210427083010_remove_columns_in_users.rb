class RemoveColumnsInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    remove_column :users, :address, :string
    remove_column :users, :introduction, :text
  end
end

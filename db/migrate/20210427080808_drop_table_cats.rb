class DropTableCats < ActiveRecord::Migration[5.2]
  def change
    drop_table :cats
  end
end

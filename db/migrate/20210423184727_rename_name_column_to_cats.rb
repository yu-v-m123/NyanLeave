class RenameNameColumnToCats < ActiveRecord::Migration[5.2]
  def change
    rename_column :cats, :name, :cat_name
  end
end

class RenameEndColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :end, :finish
  end
end

class RenameOwnerIdColumunToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :owner_id, :contributor_id
  end
end

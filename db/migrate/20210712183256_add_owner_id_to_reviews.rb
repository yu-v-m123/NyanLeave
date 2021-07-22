class AddOwnerIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :owner_id, :integer
  end
end

class AddUserRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :contributor, foreign_key: { to_table: :users }
  end
end

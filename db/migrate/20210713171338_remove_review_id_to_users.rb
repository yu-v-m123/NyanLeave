class RemoveReviewIdToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :review, foreign_key: true
  end
end

class AddReviewIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :review, foreign_key: true
  end
end

class RemoveCatIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :cat, foreign_key: true
  end
end

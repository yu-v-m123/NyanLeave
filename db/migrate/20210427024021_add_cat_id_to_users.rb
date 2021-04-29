class AddCatIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :cat, foreign_key: true
  end
end

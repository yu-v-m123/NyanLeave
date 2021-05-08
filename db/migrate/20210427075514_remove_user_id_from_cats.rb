class RemoveUserIdFromCats < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cats, :user, foreign_key: true
  end
end

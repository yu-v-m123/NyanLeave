class DropUserRooms < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_rooms
  end
end

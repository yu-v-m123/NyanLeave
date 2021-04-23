class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :age
      t.string :image

      t.timestamps
    end
  end
end

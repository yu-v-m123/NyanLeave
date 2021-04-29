class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :address
      t.text :introduction
      t.string :cat_name
      t.string :age
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

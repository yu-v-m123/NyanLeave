class Profile < ApplicationRecord
  belongs_to :user
  has_many :posts
  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
    validates :address
    with_options length: { maximum:7 } do
      validates :user_name
      validates :cat_name
      validates :age
      end
    with_options length: { maximum:500 } do
      validates :introduction
    end
  end
end

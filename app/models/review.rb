class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  belongs_to :contributor, class_name: 'User', foreign_key: :contributor_id
end

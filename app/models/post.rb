class Post < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  with_options presence: true do
    validates :start
    validates :finish
    validates :place
    with_options length: { maximum:500 } do
      validates :feature
    end
  end

  validate :date_before_start
  validate :date_after_finish
  def date_before_start
    return if start.blank?
      errors.add(:start, "は今日以降のものを選択してにゃ") if start < Date.today
  end
  
  def date_after_finish
    return if finish.blank? || start.blank?
      errors.add(:finish, "は開始日以降のものを選択してにゃ") if finish < start
  end
end

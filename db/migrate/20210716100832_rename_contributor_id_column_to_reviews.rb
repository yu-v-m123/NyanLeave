class RenameContributorIdColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :contributor_id, :contributor
  end
end

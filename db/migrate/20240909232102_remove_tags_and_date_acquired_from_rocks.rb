class RemoveTagsAndDateAcquiredFromRocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :rocks, :tags, :string
    remove_column :rocks, :date_acquired, :date
  end
end

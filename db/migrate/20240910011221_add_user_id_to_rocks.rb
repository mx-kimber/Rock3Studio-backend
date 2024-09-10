class AddUserIdToRocks < ActiveRecord::Migration[7.1]
  def change
    add_column :rocks, :user_id, :integer
  end
end

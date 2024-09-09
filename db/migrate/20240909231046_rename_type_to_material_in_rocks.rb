class RenameTypeToMaterialInRocks < ActiveRecord::Migration[6.1]
  def change
    rename_column :rocks, :type, :material
  end
end

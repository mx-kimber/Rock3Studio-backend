class AddWeightUnitToRocks < ActiveRecord::Migration[7.1]
  def change
    add_column :rocks, :weight_unit, :string
  end
end

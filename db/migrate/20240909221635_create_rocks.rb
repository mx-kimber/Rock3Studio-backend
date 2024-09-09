class CreateRocks < ActiveRecord::Migration[6.1]
  def change
    create_table :rocks do |t|
      t.string  :rock_name
      t.string  :type
      t.decimal :weight
      t.string  :location
      t.decimal :price
      t.date    :date_acquired
      t.text    :notes
      t.string  :color
      t.string  :condition
      t.string  :dimensions
      t.string  :source
      t.string  :category
      t.decimal :hardness
      t.string  :tags, array: true, default: []

      t.timestamps
    end
  end
end

class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.references :rock, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end

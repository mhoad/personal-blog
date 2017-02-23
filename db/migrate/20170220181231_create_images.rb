class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :caption
      t.string :licence
      t.string :geo_location
      t.string :image

      t.timestamps
    end
  end
end

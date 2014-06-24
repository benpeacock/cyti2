class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :address
      t.date :endDate
      t.string :imageThumbUrl
      t.string :moreInfo
      t.text :shortDescription
      t.string :title

      t.timestamps
    end
  end
end

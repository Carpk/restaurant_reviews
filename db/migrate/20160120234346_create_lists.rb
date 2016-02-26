class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :restaurant
      t.references :review
      t.string     :title
      t.text       :body

      t.timestamps
    end
  end
end

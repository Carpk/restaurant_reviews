class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :restaurant
      t.string     :title
      t.string     :entree
      t.string     :picture_url
      t.integer    :price
      t.integer    :score
      t.text       :body

      t.timestamps
    end
  end
end

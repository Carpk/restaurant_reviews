class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :resturant
      t.string     :title
      t.string     :entree
      t.integer    :price
      t.integer    :score
      t.text       :body

      t.timestamps
    end
  end
end

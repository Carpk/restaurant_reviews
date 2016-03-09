class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :restaurants, :categories do |t|
      # t.index [:restaurant_id, :category_id]
      # t.index [:category_id, :restaurant_id]
    end

    create_table :restaurant_listings do |t|
      t.belongs_to :restaurant
      t.belongs_to :list
      t.text :body
    end

    create_table :review_listings do |t|
      t.belongs_to :review
      t.belongs_to :list
      t.text :body
    end
  end
end

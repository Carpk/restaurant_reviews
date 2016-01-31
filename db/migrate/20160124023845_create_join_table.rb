class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :restaurants, :categories do |t|
      # t.index [:restaurant_id, :category_id]
      # t.index [:category_id, :restaurant_id]
    end

    create_join_table :restaurants, :lists do |t|
      # t.index [:restaurant_id, :list_id]
      # t.index [:list_id, :restaurant_id]
      t.text :body
    end
  end
end

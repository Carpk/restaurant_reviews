class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.references :area
      t.string  :name
      t.text    :body
      t.integer :score
      t.integer :expense
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
  end
end

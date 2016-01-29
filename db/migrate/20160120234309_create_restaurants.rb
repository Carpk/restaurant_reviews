class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.references :area
      t.string  :name
      t.integer :score
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
  end
end

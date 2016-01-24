class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.references :area
      t.string  :name
      t.integer :score

      t.timestamps
    end
  end
end

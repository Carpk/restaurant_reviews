class CreateResturants < ActiveRecord::Migration
  def change
    create_table :resturants do |t|
      t.string  :name
      t.integer :score
    end
  end
end

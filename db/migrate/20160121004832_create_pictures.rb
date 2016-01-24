class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :review
      t.string :address

      t.timestamps
    end
  end
end

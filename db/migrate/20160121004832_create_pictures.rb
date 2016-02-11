class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :review
      t.string :url, default: '/assets/default.jpg'

      t.timestamps
    end
  end
end

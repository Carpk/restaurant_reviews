class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :address
    end
  end
end

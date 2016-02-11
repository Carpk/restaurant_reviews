class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :picture
      t.string     :name
      t.text       :description

      t.timestamps
    end
  end
end

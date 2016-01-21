class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text   :description
    end
  end
end

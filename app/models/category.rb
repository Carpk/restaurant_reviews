class Category < ActiveRecord::Base
  has_and_belongs_to_many :restaurants

  def self.split_all
    all = Category.all
    all.each_slice((all.length/2.0).ceil).to_a
  end
end

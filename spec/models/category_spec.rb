require 'rails_helper'

describe Category do

  let(:category) {Category.first}

  it "should default to stock picture" do
    expect(category.picture.url).to match(/default/)
  end

  it "show all pictures for category" do
    expect(category.all_pictures.first.class).to eq(Picture)
  end
end

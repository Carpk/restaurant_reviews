require 'rails_helper'

describe Restaurant do

  let(:restaurant) {Restaurant.first}

  it "should return a number score for an average" do
    expect(Restaurant.score_avg.class).to eq(Float)
  end

  it "should create category association from array" do
    array_count = restaurant.categories.count
    restaurant.add_categories([1])
    expect(restaurant.categories.count).to eq(array_count + 1)
  end

  it "should return a differant set of categories" do
    restaurant.edit_categories([1])
    expect(restaurant.categories.count).to eq(1)
  end

  it "should return default picture" do
    expect(restaurant.picture.url).to match(/default/)
  end

  it "should return set picture" do
    restaurant.reviews << Review.first
    expect(restaurant.picture.url).to match(/amazonaws/)
  end

  it "should return and array of pictures" do
    expect(restaurant.all_pictures.class).to eq(Array)
  end
end

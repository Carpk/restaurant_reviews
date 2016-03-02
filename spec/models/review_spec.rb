require 'rails_helper'

describe Review do

  let(:review) {Review.last}

  it "should return a limited amount of text" do
    expect(review.body_sample.size).to eq(38)
  end
end

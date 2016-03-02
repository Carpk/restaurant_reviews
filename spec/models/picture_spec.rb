require 'rails_helper'

describe Picture do

  it "should return a default picture" do
    expect(Picture.default_pic.url).to match(/default/)
  end
end

class ReviewListing < ActiveRecord::Base
  belongs_to :review
  belongs_to :list
end


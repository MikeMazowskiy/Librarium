class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :profile
end

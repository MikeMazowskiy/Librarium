class Review < ApplicationRecord
  has_many :comments
  belongs_to :book
  belongs_to :profile
end

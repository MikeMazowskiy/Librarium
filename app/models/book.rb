class Book < ApplicationRecord
  has_and_belongs_to_many :profiles, join_table: "books_profiles"
  has_and_belongs_to_many :tags
  belongs_to :author
  has_many :reviews
end

class Book < ApplicationRecord
  has_and_belongs_to_many :profiles, join_table: "books_profiles"
  belongs_to :author
end

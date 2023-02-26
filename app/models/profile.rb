class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books, join_table: "books_profiles"
end

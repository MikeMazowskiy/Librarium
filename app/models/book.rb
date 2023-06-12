class Book < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_and_belongs_to_many :profiles, join_table: "books_profiles"
  has_and_belongs_to_many :tags
  belongs_to :author
  has_many :reviews
  has_many :lists_books
  has_many :lists, through: :lists_books
end

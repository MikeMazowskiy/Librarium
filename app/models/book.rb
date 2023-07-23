class Book < ApplicationRecord
  include Tagging

  after_commit :create_tags, on: :create

  has_and_belongs_to_many :profiles, join_table: "books_profiles"
  belongs_to :author
  has_many :reviews
  has_many :lists_books
  has_many :lists, through: :lists_books

  mount_uploader :image, ImageUploader
end

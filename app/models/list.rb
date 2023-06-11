class List < ApplicationRecord
  has_many :lists_books
  has_many :books, through: :lists_books
  belongs_to :profile
end

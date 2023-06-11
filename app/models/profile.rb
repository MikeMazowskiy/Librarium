class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :lists
  has_many :reviews
  has_many :favorites, foreign_key: :profile_id, class_name: "Favorite"
  has_and_belongs_to_many :books, join_table: "books_profiles"
end

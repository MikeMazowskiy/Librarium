class Review < ApplicationRecord
  include Tagging

  after_commit :create_tags, on: :create

  has_many :comments
  belongs_to :book
  belongs_to :profile
end

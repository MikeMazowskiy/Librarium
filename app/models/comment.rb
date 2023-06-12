class Comment < ApplicationRecord
  include Tagging

  after_commit :create_tags, on: :create

  belongs_to :review
  belongs_to :profile
end

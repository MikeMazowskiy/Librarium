class Tag < ApplicationRecord
  has_many :taggable_tags

  with_options through: :taggable_tags, source: :taggable do
    has_many :reviews,  source_type: 'Review'
    has_many :comments, source_type: 'Comment'
    has_many :books,    source_type: 'Book'
  end

end

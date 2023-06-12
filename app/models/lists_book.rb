class ListsBook < ApplicationRecord
  belongs_to :book
  belongs_to :list

  validates_uniqueness_of :book_id, scope: :list_id
  validate :validate_book_uniqueness_in_lists

  def validate_book_uniqueness_in_lists
    if ListsBook.joins(:list).where(lists: { profile_id: list.profile_id }, book_id: book_id).exists?
      errors.add(:book_id, "is already associated with another list within the profile")
    end
  end
end

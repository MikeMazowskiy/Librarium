class List < ApplicationRecord
  has_many :books
  belongs_to :profile
end

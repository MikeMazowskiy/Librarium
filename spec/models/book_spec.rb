require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:profiles).join_table("books_profiles") }
    it { should have_and_belong_to_many(:tags) }
    it { should belong_to(:author) }
  end
end

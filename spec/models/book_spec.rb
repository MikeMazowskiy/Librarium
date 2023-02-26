require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:profiles).join_table("books_profiles") }
  end
end

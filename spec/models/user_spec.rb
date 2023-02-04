require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has_one profile' do
      expect(user).to has_one(profile)
    end
  end
end

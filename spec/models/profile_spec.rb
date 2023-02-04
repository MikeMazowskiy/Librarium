require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it 'belongs_to user' do
      expect(profile).to belongs_to(user)
    end
  end
end

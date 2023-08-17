require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = build(:user, email: 'federica@test.com')
    @group = build(:group, user: @user)
  end

  describe 'Group validations' do
    it 'is valid with valid attributes' do
      expect(@group).to be_valid
    end

    it 'is not valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid, 'Expected group with nil name to be invalid, but it was valid'
    end

    it 'is not valid without an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid, 'Expected group with nil icon to be invalid, but it was valid'
    end

    it 'is not valid without a user' do
      @group.user = nil
      expect(@group).to_not be_valid, 'Expected group with nil user to be invalid, but it was valid'
    end
  end
end

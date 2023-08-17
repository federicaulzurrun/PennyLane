require 'rails_helper'

RSpec.describe Movement, type: :model do
  before(:each) do
    @user = User.create(name: 'Federica Ulzurrun', email: 'federica@example.com', password: '123456')
    @group = Group.create(icon: 'icon.png', name: 'Group', user_id: @user.id)
    @movement = Movement.create(
      name: 'Testing',
      amount: 100,
      group_id: @group.id,
      user_id: @user.id,
      author: @user,
      created_at: Time.now,
      updated_at: Time.now
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(@movement).to be_valid
    end

    it 'is not valid without a name' do
      @movement.name = nil
      expect(@movement).not_to be_valid
    end

    it 'is not valid without an amount' do
      @movement.amount = nil
      expect(@movement).not_to be_valid
    end

    it 'is not valid without a user' do
      @movement.user_id = nil
      expect(@movement).not_to be_valid
    end

    it 'is not valid if amount is zero' do
      @movement.amount = 0
      expect(@movement).not_to be_valid
    end
  end
end

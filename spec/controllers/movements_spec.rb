require 'rails_helper'

RSpec.describe 'Movements', type: :request do
  before(:example) do
    @user = User.create(name: 'Federica Ulzurrun', email: 'federica@example.com', password: '123456')
    @group = Group.create(icon: 'icon.png', name: 'Group', user_id: @user.id)
    @movement = Movement.create(name: 'Transaction', amount: 100, group_id: @group.id, user_id: @user.id)
  end

  describe 'GET /movements' do
    before(:example) { get('/groups/1/movements') }

    it 'Returns http found' do
      expect(response).to have_http_status(:found)
    end

    it 'The user is redirected to sign_in' do
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'Includes the correct placeholder text' do
      expect(response.body).to include 'redirected'
    end
  end
end

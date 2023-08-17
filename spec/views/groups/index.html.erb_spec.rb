require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Federica Ulzurrun', email: 'federica@example.com', password: '123456')
    @group = Group.create(icon: 'https://example.com/icon.png', name: 'Group', user_id: @user.id)
    @movement = Movement.create(
      name: 'Testing',
      amount: 100,
      group_id: @group.id,
      user_id: @user.id,
      author: @user,
      created_at: Time.now,
      updated_at: Time.now
    )
    visit new_user_session_path
    fill_in 'Email', with: 'federica@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'Logged user can visit the groups index page' do
    visit groups_path

    expect(page).to have_content('Aggregate Spending')
    expect(page).to have_content("$#{@movement.amount}")
  end

  it 'Logged user can visit the new group page' do
    visit new_group_path

    expect(page).to have_content('New Category')
    expect(page).to have_css('form')
    expect(page).to have_css('input[type=submit]')
  end
end

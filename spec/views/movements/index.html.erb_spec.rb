require 'rails_helper'

RSpec.describe 'movements/index', type: :view do
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
    assign(:group, @group)
    assign(:movements, [@movement])
    assign(:total_amount, @movement.amount)
  end

  it 'renders the header' do
    render
    expect(rendered).to have_content('Transactions')
    expect(rendered).to have_content(@group.name)
  end

  it 'renders the transactions' do
    render
    expect(rendered).to have_content('Transactions for:')
    expect(rendered).to have_content(@movement.name)
    expect(rendered).to have_content(@movement.amount)
  end

  it 'renders the "No registered transactions" message when no movements' do
    assign(:movements, [])
    render
    expect(rendered).to have_content('No registered transactions')
    expect(rendered).to have_content('Your new transactions will be placed here')
  end

  it 'renders the "Add a new transaction" link' do
    render
    expect(rendered).to have_link('Add a new transaction', href: new_group_movement_path(group_id: @group.id))
  end
end

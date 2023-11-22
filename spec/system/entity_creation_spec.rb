require 'rails_helper'

RSpec.describe 'Entity creation', type: :system do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password', id: 1)
  end
  let(:group) do
    Group.create(name: 'transport', icon: 'airplane.png', user_id: user.id)
  end

  before do
    user.save
    sign_in user
  end

  it 'allows a user to create a new entity' do
    visit new_user_group_entity_path(user, group)
    fill_in 'name', with: 'car ride'
    fill_in 'amount', with: '10'
    check(page.all("input[type='checkbox']").first[:id])
    click_button 'Create Entity'
  
    expect(page).to have_content('transport')
    expect(page).to have_content('1')
  end

  it 're renders the page when user did not input values' do
    visit new_user_group_entity_path(user, group)

    click_button 'Create Entity'
  
    expect(page).to have_content('3 errors prohibited this entity from being saved:')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Groups can\'t be blank')
    expect(page).to have_content('Amount can\'t be blank')
  end
end
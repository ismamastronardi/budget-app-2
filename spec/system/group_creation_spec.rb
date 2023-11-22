require 'rails_helper'

RSpec.describe 'Group creation', type: :system do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password', id: 1)
  end

  before do
    user.save
    sign_in user
  end

  it 'allows a user to create a new group' do
    visit new_user_group_path(user)
    fill_in 'name', with: 'transport'
    choose(page.all("input[type='radio']").first[:id])
    click_button 'Create Group'
  
    expect(page).to have_content('transport')
  end

  it 'allows a user to create a new group' do
    visit new_user_group_path(user)

    click_button 'Create Group'
  
    expect(page).to have_content('2 errors prohibited this group from being saved:')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Icon can\'t be blank')
  end


end

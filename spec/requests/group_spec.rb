require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Groups index', type: :request do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password')
  end
  let!(:group) do
    Group.new(name: 'Transport', icon: 'airplane.png', user_id: user.id)
  end

  before do
    user.groups << group
    user.save
    sign_in user
  end

  describe 'GET /groups' do
    it 'Renders the index page successfully' do
      get "/users/#{user.id}/groups"
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
      expect(response.body).to include('Transactions')
    end

    it 'Renders the groups in the page' do
      get "/users/#{user.id}/groups"
      expect(response.body).to include('Transport')
      expect(response.body).to include('0')
      expect(response.body).to include('class="max-h-12"')
    end
  end
end

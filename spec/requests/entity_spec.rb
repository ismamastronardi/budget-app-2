require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Entities index', type: :request do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password')
  end
  let!(:group) do
    Group.create(name: 'Transport', icon: 'airplane.png', user_id: user.id)
  end
  let!(:entity) do
    Entity.new(name: 'car ride', amount: 10, author_id: user.id, groups: [group])
  end

  before do
    user.groups << group
    group.entities << entity
    user.save
    sign_in user
  end

  describe 'GET /entities' do
    it 'Renders the index page successfully' do
      get "/users/#{user.id}/groups/#{group.id}/entities"
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
      expect(response.body).to include('Transactions')
      expect(response.body).to include('Total Transactions: 2')
    end

    it 'Renders the entities in the page' do
      get "/users/#{user.id}/groups/#{group.id}/entities"
      expect(response.body).to include('Car ride')
      expect(response.body).to include('Amount: $10.0')
      expect(response.body).to include('class="max-h-6')
    end
  end
end

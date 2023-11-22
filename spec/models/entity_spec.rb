require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password', id: 1)
  end
  let(:group) do
    Group.new(name: 'transport', icon: 'icon', user_id: user.id)
  end
  subject { Entity.new(name: 'car ride', amount: 10, author_id: user.id) }

  before { 
    subject.groups << group
    subject.save 
  }

  it 'is valid with valid parameters' do
    expect(subject).to be_valid
  end

  it 'is not valid with null name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with null amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to group' do
    expect(group.entities).to eq([subject])
  end
end

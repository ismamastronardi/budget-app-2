require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create(name: 'example_user', email: 'user@example.com', password: 'password', id: 1)
  end
  subject { Group.new(name: 'apple', icon: 'icon', user_id: user.id) }

  before { subject.save }

  it 'is valid with all valid parameters' do
    expect(subject).to be_valid
  end

  it 'is not valid with null name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with null icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'should belong to user' do
    expect(user.groups).to eq([subject])
  end
end

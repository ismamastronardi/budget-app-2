require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'example_user', email: 'user@example.com', password: 'password', id: 1) }

  before { subject.save }

  it 'is valid with all valid parameters' do
    expect(subject).to be_valid
  end

  it 'is not valid with null name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with null email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with null password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end

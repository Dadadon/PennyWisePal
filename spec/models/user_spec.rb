require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      name: 'John Doe',
      email: 'johndoe@example.com',
      encrypted_password: 'password'
    )
  end

  context 'Testing validations' do
    it 'User should have a name' do
      expect(@user.name).to eq('John Doe')
    end

    it 'User should have an email' do
      expect(@user.email).to eq('johndoe@example.com')
    end

    it 'User should have a password' do
      expect(@user.encrypted_password).to eq('password')
    end
  end

  context 'Testing associations' do
    it 'User should have many categories' do
      association = User.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
    end

    it 'User should have many movements' do
      association = User.reflect_on_association(:payments)
      expect(association.macro).to eq(:has_many)
    end
  end
end

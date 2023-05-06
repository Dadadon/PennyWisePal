require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(
      name: 'John Doe',
      email: 'johndoe@example.com',
      encrypted_password: 'password'
    )
    @category = Category.create(
      name: 'Trips',
      icon: 'icon.png',
      user_id: @user.id
    )
  end

  context 'Testing validations' do
    it 'Should have a name' do
      expect(@category.name).to eq('Trips')
    end

    it 'Should have an icon' do
      expect(@category.icon).to eq('icon.png')
    end

    it 'Should have a user' do
      expect(@category.user_id).to eq(@user.id)
    end
  end

  context 'Testing associations' do
    it 'Should belong to a user' do
      association = Category.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'Should have many and belong to movements' do
      association = Category.reflect_on_association(:payments)
      expect(association.macro).to eq(:has_many)
    end
  end
end

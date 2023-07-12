require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.create(
      name: 'John Doe',
      email: 'johndoe@example.com',
      encrypted_password: 'password'
    )
    @payment = Payment.create(
      name: 'Tickets',
      amount: 5.0,
      user_id: @user.id
    )
  end

  context 'Testing validations' do
    it 'Should have a name' do
      expect(@payment.name).to eq('Tickets')
    end

    it 'Should have an amount' do
      expect(@payment.amount).to eq(5.0)
    end

    it 'Should have a valid amount' do
      expect(@payment.amount).to be >= 0
    end

    it 'Payment amount should be decimal' do
      expect(@payment.amount).to be_a_kind_of(BigDecimal)
    end

    it 'Should have a user' do
      expect(@payment.user_id).to eq(@user.id)
    end
  end

  context 'Testing associations' do
    it 'Should have many and belong to categories' do
      association = Payment.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end
end

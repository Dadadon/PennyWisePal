require 'rails_helper'

RSpec.describe 'categories/show', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'John Doe', email: 'johndoe@example.com', password: 'password',
                        password_confirmation: 'password')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create!(name: 'Food',
                                 icon: 'https://media.istockphoto.com/id/1481730340/photo/gray-hair-man-cooking-healthy-meal-in-modern-apartment.jpg'\
                                       '?s=612x612&w=is&k=20&c=AL4fSbJx9QJ8iEsETWT1hjsIigsfQ8HfmNerlkpLveE=', user: @user)
    @payment = Payment.create(name: 'Tickets', amount: 90.0, user: @user, category_id: @category.id)
    visit category_path(@category)
  end

  it 'displays App name' do
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'displays category name' do
    expect(page).to have_content('Food')
  end

  it 'displays category name' do
    expect(page).to have_content(@category.name)
  end
end

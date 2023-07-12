require 'rails_helper'

RSpec.describe 'categories/index', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'John Doe', email: 'johndoe@example.com', password: 'password')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create!(name: 'Food',
                                 icon: 'https://media.istockphoto.com/id/1481730340/photo/gray-hair',
                                 user: @user)
    @payment = Payment.create(user: @user, name: 'Rent', amount: 1000, category_id: @category.id)
    visit categories_path
  end

  it 'displays App name' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'displays category name' do
    expect(page).to have_content(@category.name)
  end

  it 'displays updated_at date' do
    expect(page).to have_content(@category.updated_at.strftime('%d %b %Y'))
  end

  it 'displays an "ADD CATEGORY" button' do
    expect(page).to have_link('ADD CATEGORY', href: new_category_path)
  end
end

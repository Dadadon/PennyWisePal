require 'rails_helper'

RSpec.describe PaymentsController, type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'John Doe', email: 'johndoe@example.com', password: 'password')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create!(name: 'Food',
                                 icon: 'https://media.istockphoto.com/',
                                 user: @user)
  end

  describe 'GET #new' do
    before do
      get new_category_payment_path(category_id: @category.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the index template' do
      expect(response).to render_template(:new)
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('ADD')
    end
  end
end

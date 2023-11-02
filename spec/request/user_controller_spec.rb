require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      valid_attributes = { name: 'Okari', id: 200 }
      user = User.create!(valid_attributes)
      get user_url(user)
      expect(response.body).to include('<h1>Okari</h1>')
    end
  end
end

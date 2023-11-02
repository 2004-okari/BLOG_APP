require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', id: 204)
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', id: 201)
      post = Post.create(author: user, title: 'Hello', text: 'This is my first post', id: 201)
      get "/users/#{user.id}/posts"
      expect(response).to render_template('posts/index')
    end

    it 'renders the right placeholder' do
      user = User.create(name: "John Doe") # Create a user for testing
      get "/users/#{user.id}/posts"
      expect(response.body).to include('List of posts from the users')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', id: 201)
      post = Post.create(author: user, title: 'Hello', text: 'This is my first post', id: 201)
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', id: 200)
      post = Post.create(author: user, title: 'Hello', text: 'This is my first post', id: 200)
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('posts/show')
    end

    it 'renders the right placeholder' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', id: 209)
      post = Post.create(author: user, title: 'Hello', text: 'This is my first post', id: 209)
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Here is a post for given user')
    end
  end
end

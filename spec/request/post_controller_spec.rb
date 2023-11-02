# require 'rails_helper'

# RSpec.describe "Posts", type: :request do
#   describe "GET /posts" do
#     it "returns a successful response" do
#       get posts_path
#       expect(response).to have_http_status(200)
#     end

#     it 'renders the index template' do
#       get posts_path
#       expect(response).to render_template('posts/index')
#     end

#     it 'renders the right placeholder' do
#       get posts_path
#       expect(response.body).to include 'Here is a list of posts'
#     end
#   end

#   describe "GET /posts/:id" do
#     let(:post) { Post.create(title: "Sample Post", content: "Lorem ipsum dolor sit amet") }

#     it 'returns a success response' do
#       get post_path(post)
#       expect(response).to be_successful
#     end

#     it 'renders the show template' do
#       get post_path(post)
#       expect(response).to render_template('posts/show')
#     end

#     it 'includes correct placeholder text in the response body' do
#       get post_path(post)
#       expect(response.body).to include('<h1>Sample Post</h1>')
#     end
#   end
# end

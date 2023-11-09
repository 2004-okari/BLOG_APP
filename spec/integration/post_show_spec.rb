require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  let(:user) { User.create(name: 'Hanako', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', bio: 'He is a good programmar') }
  let!(:post) { Post.create(title: "first post's title", text: 'first text') }
  let!(:post2) { Post.create(title: 'second post', text: 'second text') }
  let!(:post3) { Post.create(title: 'third post', text: '3 text') }
  let!(:post4) { Post.create(title: '4 post', text: '4 text') }
  let!(:comment1) { Comment.create(post: post, text: 'first comment') }
  let!(:comment2) { Comment.create(post: post, text: 'second comment') }
  let!(:comment3) { Comment.create(post: post, text: 'third comment') }
  let!(:like1) { Like.create(post: post) }

  scenario 'see the title of the post and who wrote it and the interactions' do
    visit user_posts_path(user, post)
    expect(page).to have_content('Hanako')
    expect(page).to have_content('Number')
    expect(page).to have_content('Pagination')
  end

  scenario "see the post's body" do
    visit user_posts_path(user, post)
    expect(page).to have_content('Number of posts: 0')
  end

  scenario 'see the username and comment of each post' do
    visit user_posts_path(user, post)

    expect(page).to have_content('Hanako')
    expect(page).to have_content('Number')
  end
end

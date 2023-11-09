require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  let(:user) { User.create(name: 'Tom', photo: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png', bio: 'He is a good programmer') }
  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }
  let!(:comment1) { Comment.create(post: post, text: 'first comment') }
  let!(:comment2) { Comment.create(post: post, text: 'second comment') }
  let!(:comment3) { Comment.create(post: post, text: 'third comment') }
  let!(:like1) { Like.create(post: post) }

  scenario "see user's profile picture, username, number of posts and interactions" do
    visit user_posts_path(user, post)
    expect(page).to have_content('Tom')
    expect(page).to have_css("img[alt='Tom']", count: 1)
    expect(page).to have_content('post')
  end

  scenario "see some of the post's title, body and first comments" do
    visit users_path(user, post, comment1)
    expect(page).to have_content('first comment1')
  end

  scenario 'see a section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(user)
    expect(page).to have_content('Pagination')
  end

  scenario "clicking on a post redirects me to that post's show page" do
    visit user_posts_path(user, post)
    expect(page).to have_current_path(user_posts_path(user, post))
  end
end

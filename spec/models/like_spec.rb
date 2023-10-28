require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @author = User.create(name: 'Okari Nyandika', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student a microverse.')
    @user = User.create(name: 'Samsom Opiyo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.create(author: @author, title: 'Okari Nyandika', text: 'Hello World', comments_counter: 0,
                        likes_counter: 0)
  end

  context '#create' do
    it 'is valid with existing user and post' do
      expect(Like.new(user: @user, post: @post)).to be_valid
    end

    it 'is not valid without post' do
      expect(Like.new(user: @user)).to_not be_valid
    end

    it 'is not valid without user' do
      expect(Like.new(post: @post)).to_not be_valid
    end
  end

  context '#update_likes_counter' do
    before :all do
      5.times { Like.create(user: @user, post: @post) }
    end

    it 'keeps track of likes and equals 5' do
      expect(@post.likes_counter).to eq 5
    end
  end
end

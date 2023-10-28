require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'is valid with a name' do
      user = User.new(name: 'John Doe', posts_counter: 3)
      expect(user).to be_valid
    end

    it 'is not valid with a negative posts_counter' do
      user = User.new(name: 'Alice', posts_counter: -3)
      expect(user).to_not be_valid
    end
  end

  describe '#recent_posts' do
    let(:user) { User.create!(name: 'John Doe', posts_counter: 3) }
    let!(:old_post) do
      Post.create!(author: user, title: 'Old Post', text: 'Hello World', comments_counter: 0, likes_counter: 0,
                   created_at: 2.days.ago)
    end
    let!(:recent_posts) do
      5.times.map do
        Post.create!(author: user, title: 'Recent Post', text: 'Hello World', comments_counter: 0, likes_counter: 0)
      end
    end

    it 'returns the most recent posts' do
      expect(user.recent_posts).to eq(recent_posts.reverse)
    end
  end
end

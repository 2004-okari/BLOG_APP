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
end

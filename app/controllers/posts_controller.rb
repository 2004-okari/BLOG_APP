class PostsController < ApplicationController
  def index
    @user = User.includes(posts: %i[comments likes]).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
end

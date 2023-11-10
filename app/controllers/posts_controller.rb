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

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end

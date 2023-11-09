class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render :index
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

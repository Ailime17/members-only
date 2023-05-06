class PostsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to root_path
  end

  def index
    
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

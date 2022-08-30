class PostsController < ApplicationController
  before_action :find_user, only: [:index ,:create, :new ]
  def index
    @posts = @user.posts.all
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

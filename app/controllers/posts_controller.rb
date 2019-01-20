class PostsController < ApplicationController

  before_action :logged_in?, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    puts @current_user.name
    @post = Post.new(body: params[:post][:body], author: params[:author])
    if @post.save
      redirect_to all_posts_path
    else
      flash.now[:danger] = "Post creation failed"
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end
end

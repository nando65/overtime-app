class PostsController < ApplicationController
  before_action :set_post, only:[:show]
  def index
    @posts = Post.all
  end

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(params.require(:post).permit(:date,:rationale))
    @post.user_id=current_user.id

    if @post.save
      redirect_to @post, notice:"Success"
    else
      render :new
    end
  end
  def show
  end
  def set_post
    @post = Post.find(params[:id])
  end
end

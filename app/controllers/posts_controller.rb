class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: "Post was successfully created"
    else
      render :new
    end
  end

  def show
    @post = Post.includes(comments: [:user]).find(params[:id])
    @comment = @post.comments.new(user: current_user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :photo)
  end

end

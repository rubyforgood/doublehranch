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

  def comment
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.commentable_id = params[:post_id]
    @comment.commentable_type = "Post"

    if @comment.save
      redirect_to post_path(@comment.commentable_id), notice: "Comment was successfully created"
    else
      render post_path(@comment.commentable_id)
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
    params.require(:post).permit(:caption, :photo, :tag_list)
  end

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end

end

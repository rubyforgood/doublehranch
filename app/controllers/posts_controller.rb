class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    params_copy = post_params.clone
    params_copy[:user_id] = current_user.id


    posts = (params[:post][:photo] || []).map do |photo|
      params_copy[:photo] = photo
      Post.new params_copy
    end

    saved = if posts.empty?
              @post = Post.new(post_params)
              @post.errors.add(:photo, 'No image provided')
              false
            else
              ActiveRecord::Base.transaction do
                posts.map {|p| p.save }.all?
              end
            end

    if saved
      redirect_to posts.first, notice: 'Post was successfully created'
    else
      @post ||= Post.new(post_params)
      render :new
    end
  end

  def comment
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.commentable_id = params[:post_id]
    @comment.commentable_type = 'Post'

    if @comment.save
      redirect_to post_path(@comment.commentable_id), notice: 'Comment was successfully created'
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

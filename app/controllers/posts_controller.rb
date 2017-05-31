class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :edit_tags]
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'


  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.includes(comments: [:user]).find(params[:id])
    @comment = Comment.new(commentable_type: 'Post', commentable_id: @post.id, user: current_user)
  end

  def new
    @post = Post.new
  end

  def create
    post_attrs = post_params.clone
    post_attrs[:user_id] = current_user.id
    photos = post_attrs.delete(:photos) || []

    posts = photos.map do |photo|
      Post.new(post_attrs.merge({ photo: photo }))
    end

    saved = ActiveRecord::Base.transaction do
      posts.map {|p| p.save }.all?
    end

    saved = false if posts.empty?

    if saved
      redirect_to posts.first, notice: 'Post was successfully created'
    else
      @post = Post.new(post_attrs)
      @post.valid?
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

  def edit_tags
    @post.tag_list = params[:post][:tag_list]
    if @post.save
      redirect_to post_path(@post), notice: 'Tags were successfully updated'
    else
      redirect_to post_path(@post), notice: 'Tags were unable to update'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :caption,
      :tag_list,
      :user_id,
      photos: [],
    )
  end

  def comment_params
    params.require(:comment).permit(
      :comment,
      :commentable_id,
      :commentable_type,
    )
  end

end

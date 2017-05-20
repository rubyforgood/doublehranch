class HomeController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(10)

    if params[:tag]
      @photos = Post.tagged_with(params[:tag])
    else
      @photos = Post.all
    end
  end
end

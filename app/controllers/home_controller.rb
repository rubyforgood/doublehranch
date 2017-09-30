class HomeController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(5)
    @announcements = Announcement.active

    if params[:tag]
      @photos = Post.hidden(false).tagged_with(params[:tag]).last(10)
    else
      @photos = Post.hidden(false).last(10)
    end

    @name = current_user.friendly_name
  end
end

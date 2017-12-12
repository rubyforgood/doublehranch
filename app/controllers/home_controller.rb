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

  def admin_panel
    @user_count = User.all.length
    @active_user_count = User.where.not(last_sign_in_at: nil).all.length
    @announcement_count = Announcement.all.length
    @active_announcement_count = Announcement.active.length
    @program_count = Program.all.length
    @positions_count = Position.all.length
    @positions_held_count = PositionsHeld.all.length
    @greenhouse_post_count = Post.all.length
    @comment_count = Comment.all.length
  end
end

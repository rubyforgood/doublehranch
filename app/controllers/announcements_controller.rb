class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:edit, :update, :destroy]

  def index
    @announcements = Announcement.all || []
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = 'Announcement created!'
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    announcement = Announcement.find(params[:id])
    if announcement.update(announcement_params)
      flash[:success] = 'Announcement updated!'
      redirect_to action: 'show'
    else
      render 'edit'
    end
  end

  def destroy
    announcement = Announcement.find(params[:id])
    if announcement.destroy
      flash[:success] = 'Announcement deleted!'
      redirect_to action: 'index'
    else
      render 'show'
    end
  end

  private

  def set_announcement
    @announcement = Post.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(
      :text,
      :start_date,
      :end_date
    )
  end
end

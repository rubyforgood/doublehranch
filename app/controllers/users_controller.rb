class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @years = [2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004, 2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993, 1992]
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      redirect_to user_profile_path(@user), notice: 'User updated.'
    else
      render :edit, alert: 'Unable to update user.'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :admin,
      :city,
      :country,
      :email,
      :facebook_username,
      :first_name,
      :instagram_username,
      :last_name,
      :linkedin_username,
      :maiden_name,
      :nickname,
      :password,
      :phone,
      :pinterest_name,
      :privacy_settings,
      :profile_photo_content_type,
      :profile_photo_file_name,
      :profile_photo_file_size,
      :profile_photo,
      :salutation,
      :state,
      :street_address,
      :tumblr_name,
      :twitter_handle,
      :zip_code,
    )
  end

end

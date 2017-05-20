class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: 'User updated.'
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :country, :zip_code, :maiden_name, :salutation, :privacy_settings, :email, :password, :phone, :facebook_username, :twitter_handle, :instagram_username, :tumblr_name, :linkedin_username, :pinterest_name, :profile_photo_file_size, :profile_photo_file_name, :profile_photo_content_type)
  end
end

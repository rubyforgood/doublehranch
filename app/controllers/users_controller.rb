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

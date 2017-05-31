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

  def update_privacy
    @user = User.find(params[:user_id])
    @user.privacy_settings = ['personal', 'social', 'contact', 'camp'].reduce({}) do |h, key|
      temp = params[:preferences][key] || {}
      temp.each do |k,v|
        temp[k] = (v == "true")
      end
      h[key] = temp; h
    end

    if @user.save
      redirect_to edit_user_profile_path(@user)
    else
      raise 'hello'
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

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

    privacy_settings_params.each do |setting|
        @user.update(privacy_settings: setting)
    end

    if @user.update_attributes(user_params)
      redirect_to user_profile_path(@user), notice: 'User updated.'
    else
      render :edit, alert: 'Unable to update user.'
    end
  end
  
  def update_privacy_settings
    @user = User.find(params[:user_id])

    if @user.update(privacy_settings: privacy_settings_params)
      redirect_to user_profile_path(@user), notice: 'Privacy settings updated.'
    else
      render :edit, alert: 'Unable to update privacy settings.'
    end
  end

  def import
    uploaded_file = params[:file]
    importer = UserImporter.new(uploaded_file.path.to_s)
    if importer.valid_headers?
      importer.import_by_row
    else
      header_mismatch = importer.compare_headers
      flash[:error] = "Headers in spreadsheet do not match the expected layout. We expect: #{header_mismatch[:expected]}, and received #{header_mismatch[:actual]}"
      redirect_back(fallback_location: users_import_path)
    end
  end

  def upload
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

  def privacy_settings_params
    params.require(:privacy_settings).permit!
  end

end

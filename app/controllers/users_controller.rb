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

  def import
    uploaded_file = params[:file]
    importer = UserImporter.new(uploaded_file.path.to_s)
    
    importer.import_by_row
    binding.pry
    #redirect_to import_volunteer_path, notice: "Import completed! #{importer.row_success_count} rows processed, with #{importer.row_error_count} errors."
    #@participants_unpaginated = set_all_filtered_participants("alpha")
    #@participants = paginated(@participants_unpaginated, 20)
    #render :'participants/import_volunteers'
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

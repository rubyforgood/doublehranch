class VerificationController < ApplicationController
  skip_before_action :authenticate_user!

  # TODO Look up user through invitation
  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])

    if @user.update(verification_params)
      redirect_to new_user_session_path
    else
      render :edit
    end
  end

  private

  def verification_params
    permitted_params = %i(
      city
      country
      email
      first_name
      last_name
      maiden_name
      salutation
      state
      street_address
      zip_code
    )

    params.require(:user).permit(*permitted_params)
  end
end

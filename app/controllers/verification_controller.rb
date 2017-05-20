class VerificationController < ApplicationController
  skip_before_action :authenticate_user!

  # TODO Look up user through invitation
  def edit
    @user = User.find(params[:user_id])
  end

  def update
  end
end

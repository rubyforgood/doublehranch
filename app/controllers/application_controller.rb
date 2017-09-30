class ApplicationController < ActionController::Base
  include Pundit
  include Rails.application.routes.url_helpers
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:salutation,
                                             :first_name,
                                             :last_name,
                                             :admin
                                      ])
  end
end

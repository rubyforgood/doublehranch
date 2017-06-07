class ApplicationController < ActionController::Base
  include Pundit
  include Rails.application.routes.url_helpers
  protect_from_forgery with: :exception

  before_action :authenticate_user!

end

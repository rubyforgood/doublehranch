class HomePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index
    @user
  end

  def admin_panel?
    @current_user.admin?
  end

end

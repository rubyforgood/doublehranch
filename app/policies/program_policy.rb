class ProgramPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @program = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def list?
    user.admin?
  end

  def upload
    user.admin?
  end

  def import
    user.admin?
  end


end

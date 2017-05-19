class UserPolicy
  attr_reader :current_user, :model

<<<<<<< HEAD
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.admin?
=======
  def edit?
    user.admin? || record.user == user
>>>>>>> f63f289e11823f814b1688a511075ebdaa122b65
  end

  def destroy?
    user.admin? || record.user == user
  end


end

class UserPolicy < ApplicationPolicy

  def edit?
    user || admin?
  end

end

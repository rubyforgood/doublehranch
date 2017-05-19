class UserPolicy < ApplicationPolicy

  def edit?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end


end

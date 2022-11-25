class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true

  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    if @current_user
      record.user == user || user.admin?
    end

  end

  def destroy?
    if @current_user
      record.user == user || user.admin?
    end
  end
end

class CoinPolicy < ApplicationPolicy

  # For index
  class Scope < Scope
    def resolve
      if (user.superadmin? || user.admin? || user.trader?)
        scope.all
      else
        nil
      end
    end
  end

  def show?
    user.superadmin? || user.admin? || user.trader?
  end

  def create?
    user.superadmin? || user.admin?
  end

  def new?
    create?
  end

  def edit?
    user.superadmin? || user.admin?
  end

  def update?
    user.superadmin? || user.admin?
  end

  def destroy?
    user.superadmin? || user.admin?
  end
end

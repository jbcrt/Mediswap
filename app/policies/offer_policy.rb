class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def show?
    return true # All users can view an offer view
  end

  def update?
    record.user == current_user
  end

  def destroy?
    record.user == current_user
  end
end

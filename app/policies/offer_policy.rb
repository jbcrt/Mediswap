class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true # All users can create a new offer view
  end

  def show?
    return true # All users can view an offer view
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

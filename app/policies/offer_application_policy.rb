class OfferApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user != record.applicable.user && user.profile.profession == record.applicable.profession && (user.offer_applications.find_by applicable_id: "#{record.applicable_id}").nil?
  end

end

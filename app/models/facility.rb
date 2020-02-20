class Facility < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, if: :validate_on_create?
    validates :category, presence: true, inclusion: { in: FACILITY_CATEGORIES.keys }, if: :validate_on_create?

    private

    def validate_on_create?
        self.user.user_type == "health_facility_recruiter" ? true : false
    end

end

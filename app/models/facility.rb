class Facility < ApplicationRecord
    belongs_to :user

    validates :description, presence: true, on: :update
    # validates :phone_number, allow_blank: true
    # validates :email_address, allow_blank: true
    validates :street, presence: true, on: :update
    # validates :additional_address, allow_blank: true
    validates :department, presence: true, on: :update
    validates :zipcode, presence: true, on: :update
    validates :city, presence: true, on: :update
    
    with_options if: Proc.new { |a| a.user.user_type == "health_professional" } do |facility|
        facility.validates :name, presence: true, on: :update
        facility.validates :category, presence: true, inclusion: { in: FACILITY_CATEGORIES.keys }, on: :update
        facility.validates :finess_number, absence: true
    end
    
    with_options if: Proc.new { |a| a.user.user_type == "health_facility_recruiter" } do |facility|
        facility.validates :name, presence: true
        facility.validates :category, presence: true, inclusion: { in: FACILITY_CATEGORIES.keys }
        facility.validates :finess_number, presence: true, on: :update
    end

    private

    def validate_on_create?
        self.user.user_type == "health_facility_recruiter" ? true : false
    end

end

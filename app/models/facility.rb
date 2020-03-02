class Facility < ApplicationRecord
    belongs_to :user

    has_many_attached :photos

    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

    with_options if: Proc.new { |a| a.user.user_type == "health_professional" } do |facility|
        facility.validates :name, presence: true, length: { in: 1..50 }, on: :update
        facility.validates :category, presence: true, inclusion: { in: FACILITY_CATEGORIES.keys }, on: :update
        facility.validates :finess_number, absence: true
    end
    
    with_options if: Proc.new { |a| a.user.user_type == "health_facility_recruiter" } do |facility|
        facility.validates :name, presence: true, length: { in: 1..50 }
        facility.validates :category, presence: true, inclusion: { in: FACILITY_CATEGORIES.keys }
        facility.validates :finess_number, presence: true, length: { is: 9 }, numericality: { only_integer: true }
    end

    validates :description, presence: true, length: { in: 1..10000 }, on: :update
    #  validates :phone_number, format: { with: /\A^(?:33|0)\s*[1-9](?:[\.]\d{2}){4}$\z/ }, allow_blank: true
    #  validates :email_address, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, allow_blank: true
    validates :street, presence: true, length: { in: 1..50 }, on: :update
    validates :additional_address, length: { in: 1..50 }, allow_blank: true
    validates :department, presence: true, inclusion: { in: DEPARTMENTS }, on: :update
    validates :zipcode, presence: true, length: { is: 5 }, format: { with: /\A^(?:[0-8]\d|9[0-8])\d{3}$\z/ }, on: :update
    validates :city, presence: true, length: { in: 1..50 }, format: { with: /\A^([a-zA-Z\u0080-\u024F]+(?:. |-| |'))*[a-zA-Z\u0080-\u024F]*$\z/ }, on: :update
    validates :photos, limit: { min: 0, max: 3 },
                       content_type: [:png, :jpg, :jpeg]

    before_update :check_validity

    def address
        [street, department, zipcode, city].compact.join(', ')
    end

    def address_changed?
        street_changed? || department_changed? || zipcode_changed? || city_changed?
    end

    private
    
    def check_validity
        if self.valid?
            self.completed = true
        end
    end

end

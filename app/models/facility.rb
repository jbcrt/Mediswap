class Facility < ApplicationRecord
    belongs_to :user
    has_many_attached :photos

    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    
    validates :name, presence: true, length: { in: 1..50 }
    validates :category, presence: true, inclusion: { in: FACILITY_CATEGORIES }
    validates :description, presence: true, length: { in: 1..10000 }
    validates :street, presence: true, length: { in: 1..50 }
    validates :additional_address, length: { in: 1..50 }, allow_blank: true
    validates :department, presence: true, inclusion: { in: DEPARTMENTS }
    validates :zipcode, presence: true, length: { is: 5 }, format: { with: /\A^(?:[0-8]\d|9[0-8])\d{3}$\z/ }
    validates :city, presence: true, length: { in: 1..50 }, format: { with: /\A^([a-zA-Z\u0080-\u024F]+(?:. |-| |'))*[a-zA-Z\u0080-\u024F]*$\z/ }
    validates :photos, limit: { min: 0, max: 3 },
                       content_type: [:png, :jpg, :jpeg]

    def address
        [street, department, zipcode, city].compact.join(', ')
    end

    def address_changed?
        street_changed? || department_changed? || zipcode_changed? || city_changed?
    end

end

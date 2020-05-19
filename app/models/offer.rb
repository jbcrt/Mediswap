class Offer < ApplicationRecord
  include Filterable

  # Filtres de recherche
  scope :filter_by_profession, -> (profession) { where profession: profession }
  scope :filter_by_contract_type, -> (contract_type) { where contract_type: contract_type }
  scope :filter_by_begins, -> (begins) { where("starts_at >= ?", begins) }
  scope :filter_by_ends, -> (ends) { where("ends_at <= ?", ends) }

  # Scopes liés aux types d'offre
  scope :replacements, -> { where(type: "Replacement") }
  scope :employments, -> { where(type: "Employment") }
  scope :collaborations, -> { where(type: "Collaboration") }
  scope :patient_transfers, -> { where(type: "PatientTransfer") }
  scope :establishments, -> { where(type: "Establishment") }

  # Before validation communs
  before_validation :set_profession, on: :create, if: ->(obj){ obj.set_profession? }
  before_validation :set_location, on: :create, if: ->(obj){ obj.same_address? }

  # Géolocalisation
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  # Valeurs précises
  enum working_time: { 
    full_time: "Full time",
    part_time: "Part time"
  }

  enum visit: {
    no_visits: "No visits",
    home_visits: "Home visits",
    facility_visits: "Health facility visits",
    home_and_facility_visits: "Home and health facility visits"
  }

  enum sector: {
    sector_1: "Sector 1",
    sector_2: "Sector 2",
    sector_3: "Sector 3"
  }

  enum secretariat: {
    no_secretariat: "No secretariat",
    secretariat_in_situ: "Secretariat in situ",
    switchboard: "Switchboard"
  }

  enum offer_type: { 
    standard: "Standard",
    premium: "Premium"
  }

  # Validations des champs obligatoires pour tous les types d'offre
  validates :title, length: { in: 1..50 }
  validates :profession, inclusion: { in: PROFESSIONS.keys }
  validates :description, length: { in: 1..2500 }
  validates :street, length: { in: 1..50 }
  validates :additional_address, length: { in: 1..50 }, allow_blank: true
  validates :department, inclusion: { in: DEPARTMENTS }
  validates :zipcode, length: { is: 5 }, format: { with: /\A^(?:[0-8]\d|9[0-8])\d{3}$\z/ }
  validates :city, length: { in: 1..50 }
  validates :offer_type, inclusion: { in: Offer.offer_types.keys }

  def address
    [street, department, zipcode, city].compact.join(', ')
  end

  def address_changed?
    street_changed? || department_changed? || zipcode_changed? || city_changed?
  end

  def same_address?
    self.user.facility.same_address
  end

  def set_profession?
    self.user.user_type == "health_professional" && self.type != "Establishment"
  end

  private

  def set_location
    self.street = self.user.facility.street
    self.additional_address = self.user.facility.additional_address
    self.department = self.user.facility.department
    self.zipcode = self.user.facility.zipcode
    self.city = self.user.facility.city
  end

  def set_profession
    self.profession = self.user.profession
  end

end

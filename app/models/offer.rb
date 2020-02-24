class Offer < ApplicationRecord
  include Filterable
  belongs_to :user

  # Filtres de recherche
  scope :filter_by_profession, -> (profession) { where profession: profession }
  scope :filter_by_type, -> (type) { where offer_type: type }
  scope :filter_by_begins, -> (begins) { where("starts_at >= ?", begins) }
  scope :filter_by_ends, -> (ends) { where("ends_at <= ?", ends) }

  # Géolocalisation
  geocoded_by :address
  after_validation :geocode
  # after_validation :geocode, if: :will_save_change_to_address?

  # Validations
  validates :title, presence: true
  validates :profession, presence: true
  validates :starts_at, presence: true
  validates :description, presence: true
  validates :offer_type, presence: true, inclusion: { in: OFFER_TYPES.keys }
  validates :facility_name, presence: true
  validates :facility_type, presence: true, inclusion: { in: FACILITY_CATEGORIES.keys }
  validates :facility_description, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true

  # Validations spécifiques pour les offres à durée déterminée
  with_options if: Proc.new { |a| a.offer_type == "Remplacement libéral occasionnel" } do |offer|

    offer.validates :ends_at, presence: true

  end

  def address
    [street, department, zipcode, city].compact.join(', ')
  end

end

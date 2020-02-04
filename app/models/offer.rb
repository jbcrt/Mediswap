class Offer < ApplicationRecord
  belongs_to :user

  # Filtres de recherche
  scope :profession, -> (profession) { where profession: profession }
  scope :type, -> (type) { where offer_type: type }
  scope :begins, -> (begins) { where("starts_at >= ?", begins) }
  scope :ends, -> (ends) { where("ends_at <= ?", ends) }
  scope :location, -> (location) { where city: location }
  scope :urgent, -> (urgent) { where urgent: urgent }

  # Géolocalisation
  geocoded_by :address
  after_validation :geocode
  # after_validation :geocode, if: :will_save_change_to_address?

  # Méthode de classe utilisées pour les validations spécifiques et dans les vues
  def self.offer_types
    ["Remplacement libéral occasionnel", "Remplacement libéral régulier", "Collaboration", "Assistanat", "Association", "Cession"]
  end

  # Validations
  validates :title, presence: true
  validates :profession, presence: true
  validates :starts_at, presence: true
  validates :description, presence: true
  validates :offer_type, presence: true, inclusion: { in: Offer.offer_types }
  validates :facility_name, presence: true
  validates :facility_type, presence: true, inclusion: { in: FACILITY_TYPES.keys }
  validates :facility_description, presence: true
  validates :street, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true

  # Validations spécifiques pour les offres à durée déterminée
  with_options if: Proc.new { |a| a.offer_type == "Remplacement libéral occasionnel" } do |offer|

    offer.validates :ends_at, presence: true

  end

  def address
    [street, zipcode, city].compact.join(', ')
  end

end

class Offer < ApplicationRecord
  belongs_to :user

  # Filtres de recherche
  scope :profession, -> (profession) { where profession: profession }
  scope :type, -> (type) { where offer_type: type }
  scope :begins, -> (begins) { where("starts_at >= ?", begins) }
  scope :ends, -> (ends) { where("ends_at <= ?", ends) }
  scope :location, -> (location) { where offer_city_address: location }
  scope :urgent, -> (urgent) { where urgent: urgent }

  # Géolocalisation
  geocoded_by :address
  after_validation :geocode
  # after_validation :geocode, if: :will_save_change_to_address?

  # Méthode de classe utilisées pour les validations spécifiques et dans les vues
  def self.kine_offer_types
    ["Remplacement libéral occasionnel", "Remplacement libéral régulier", "Collaboration", "Assistanat", "Association", "Cession"]
  end

  def self.offer_types
    ["Remplacement libéral occasionnel", "Remplacement libéral régulier", "Collaboration", "Association", "Cession"]
  end

  # Validations
  validates :title, presence: true
  validates :profession, presence: true
  validates :starts_at, presence: true
  validates :offer_address, presence: true
  validates :offer_postal_code_address, presence: true
  validates :offer_city_address, presence: true
  validates :description, presence: true
  validates :offer_type, presence: true

  # Validations spécifiques pour les offres des kinés
  with_options if: Proc.new { |a| a.profession == "physiotherapist" } do |kine_offer|

    kine_offer.validates :offer_type, inclusion: { in: Offer.kine_offer_types }
    kine_offer.validates :retrocession, presence: true
    kine_offer.validates :vehicle, inclusion: { in: [true, false] }
    kine_offer.validates :home_visiting, inclusion: { in: [true, false] }
    kine_offer.validates :medical_institution_visiting, inclusion: { in: [true, false] }
    kine_offer.validates :housing, inclusion: { in: [true, false] }
    kine_offer.validates :secretariat, inclusion: { in: [true, false] }

    # Validations spécifiques aux offres de "Remplacement libéral occasionnel"
    with_options if: Proc.new { |a| a.offer_type == "Remplacement libéral occasionnel" } do |offer|
      offer.validates :ends_at, presence: true
    end
    
    # Validations spécifiques aux offres de "Cession"
    with_options if: Proc.new { |a| a.offer_type == "Cession" } do |offer|
      offer.validates :ends_at, absence: true
      offer.validates :retrocession, absence: true
      offer.validates :vehicle, absence: true
      offer.validates :home_visiting, absence: true
      offer.validates :medical_institution_visiting, absence: true
      offer.validates :housing, absence: true
      offer.validates :secretariat, absence: true
    end

  end

  def address
    [offer_address, offer_postal_code_address, offer_city_address].compact.join(', ')
  end

end

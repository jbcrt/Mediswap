class Offer < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode
  # after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :profession, presence: true

  validates :offer_type, presence: true

  with_options if: :kine_offer? do |kine_offer|
    kine_offer.validates :offer_type, inclusion: { in: ["Remplacement libéral", "Collaboration libérale", "Assistanat libéral"] }
  end

  validates :starts_at, presence: true
  validates :offer_address, presence: true
  validates :offer_postal_code_address, presence: true
  validates :offer_city_address, presence: true
  validates :description, presence: true
  validates :retrocession, presence: true

  def address
    [offer_address, offer_postal_code_address, offer_city_address].compact.join(', ')
  end
  
  def kine_offer?
    user.profession == "Masseur-kinésithérapeute"
  end

  def self.offer_types(profession)
    if profession == "Masseur-kinésithérapeute"
      ["Remplacement libéral", "Collaboration libérale", "Assistanat libéral"]
    end
  end

end

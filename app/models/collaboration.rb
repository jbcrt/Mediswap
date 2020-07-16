class Collaboration < Offer
    belongs_to :user
    has_many :offer_applications, as: :applicable

    enum contract_type: { 
        assistanat: "Assistanat libéral",
        collaboration: "Collaboration"
    }

    # Les champs autorisés pour les offres de collaboration
    validates :contract_type, inclusion: { in: Collaboration.contract_types.keys }
    validates :retrocession, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    validates :daily_medical_acts_number, numericality: { greater_than: 0, only_integer: true }, allow_blank: true
    validates :on_call, inclusion: [true, false], allow_blank: true
    validates :vehicle_required, inclusion: [true, false], allow_blank: true
    validates :visit, inclusion: { in: Offer.visits.keys }, allow_blank: true
    validates :sector, inclusion: { in: Offer.sectors.keys }, allow_blank: true
    validates :secretariat, inclusion: { in: Offer.secretariats.keys }, allow_blank: true
    validates :software_used, length: { in: 1..30 }, allow_blank: true
    validates :housing_possibility, inclusion: [true, false], allow_blank: true

    # Les champs interdits pour les offres de collaboration
    validates :working_time, absence: true
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :candidate_job_experience, absence: true
    validates :candidate_description, absence: true
    validates :has_selling_price_set, absence: true
    validates :selling_price, absence: true
    validates :revenues, absence: true
    validates :premises_size, absence: true
    validates :premises_rooms_number, absence: true
    validates :premises_availability, absence: true
    validates :premises_price, absence: true
    validates :premises_rent, absence: true
    validates :premises_furnished, absence: true
    validates :premises_equipment, absence: true
    validates :premises_has_parking, absence: true
    validates :accessible_premises, absence: true

end
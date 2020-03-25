class Collaboration < Offer
    belongs_to :user

    enum contract_type: { 
        assistanat: "Assistanat libéral",
        collaboration: "Collaboration",
    }

    ## Les champs obligatoires pour les offres de collaboration
    validates :contract_type, presence: true, inclusion: { in: Collaboration.contract_types.keys }
    validates :retrocession, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    validates :vehicle, presence: true, inclusion: { in: Offer.options.keys }
    validates :home_visiting, presence: true, inclusion: { in: Offer.options.keys }
    validates :health_facility_visiting, presence: true, inclusion: { in: Offer.options.keys }
    validates :housing, presence: true, inclusion: { in: Offer.options.keys }
    validates :secretariat, presence: true, inclusion: { in: Offer.options.keys }

    ## Les champs qui ne doivent pas apparaitre dans les offres de collaboration
    validates :working_time, absence: true
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :candidate_job_experience, absence: true
    validates :candidate_description, absence: true
    validates :size, absence: true
    validates :price, absence: true
    validates :furnished, absence: true

end
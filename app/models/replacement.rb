class Replacement < Offer
    belongs_to :user

    enum contract_type: { 
        remplacement_liberal_occasionnel: "Remplacement libéral occasionnel",
        remplacement_liberal_regulier: "Remplacement libéral régulier",
    }

    ## Les champs obligatoires pour les offres de remplacement
    validates :contract_type, presence: true, inclusion: { in: Replacement.contract_types.keys }
    validates :working_time, presence: true, inclusion: { in: Offer.working_times.keys }
    validates :starts_at, presence: true
    validates :retrocession, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    validates :vehicle, presence: true, inclusion: { in: Offer.options.keys }
    validates :home_visiting, presence: true, inclusion: { in: Offer.options.keys }
    validates :health_facility_visiting, presence: true, inclusion: { in: Offer.options.keys }
    validates :housing, presence: true, inclusion: { in: Offer.options.keys }
    validates :secretariat, presence: true, inclusion: { in: Offer.options.keys }

    ## Les champs qui ne doivent pas apparaitre dans les offres de remplacement
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :candidate_job_experience, absence: true
    validates :candidate_description, absence: true
    validates :size, absence: true
    validates :price, absence: true
    validates :rent, absence: true
    validates :furnished, absence: true
    validates :patients, absence: true

    ## Les validations qui sont conditionnées au type de de contrat de remplacement selectionné
    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_occasionnel" } do |replacement_offer|
      replacement_offer.validates :ends_at, presence: true
    end

    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_regulier" } do |replacement_offer|
      replacement_offer.validates :ends_at, absence: true
    end

end
class Replacement < Offer
    belongs_to :user

    enum contract_type: { 
        remplacement_liberal_occasionnel: "Remplacement libéral occasionnel",
        remplacement_liberal_regulier: "Remplacement libéral régulier",
    }

    enum option: {
      irrelevant: "Non concerné",
      required: "Oui",
      optional: "Non"
    }

    ## Les champs obligatoires pour les offres de remplacement
    validates :contract_type, presence: true, inclusion: { in: Replacement.contract_types.keys }
    validates :working_time, presence: true, inclusion: { in: Offer.working_times.keys }
    validates :starts_at, presence: true
    validates :remuneration_type, presence: true, inclusion: { in: Offer.remuneration_types.keys }
    validates :vehicle, presence: true, inclusion: { in: Replacement.options.keys }
    validates :home_visiting, presence: true, inclusion: { in: Replacement.options.keys }
    validates :health_facility_visiting, presence: true, inclusion: { in: Replacement.options.keys }
    validates :housing, presence: true, inclusion: { in: Replacement.options.keys }
    validates :secretariat, presence: true, inclusion: { in: Replacement.options.keys }

    ## Les champs optionnels pour les offres de remplacement
    validates :candidate_job_experience, inclusion: { in: Offer.candidate_job_experiences.keys }, allow_blank: true
    validates :candidate_description, length: { in: 1..10000 }, allow_blank: true

    ## Les champs qui ne doivent pas apparaitre dans les offres de remplacement
    validates :size, absence: true
    validates :price, absence: true
    validates :furnished, absence: true
    validates :duration_type, absence: true
    validates :number_of_days, absence: true
    validates :number_of_weeks, absence: true
    validates :number_of_months, absence: true
    validates :number_of_years, absence: true

    ## Les validations qui sont conditionnées au type de de contrat de remplacement selectionné
    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_occasionnel" } do |replacement_offer|
      replacement_offer.validates :ends_at, presence: true
    end

    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_regulier" } do |replacement_offer|
      replacement_offer.validates :ends_at, absence: true
    end

    ## Les validations qui sont conditionnées au type de rémunération selectionné
    with_options if: Proc.new { |a| a.remuneration_type == "salary" } do |replacement_offer|
      replacement_offer.validates :salary, numericality: { only_integer: true, greater_than: 0 }
      replacement_offer.validates :salary_period, presence: true, inclusion: { in: Offer.salary_periods.keys }
      replacement_offer.validates :retrocession, absence: true
    end

    with_options if: Proc.new { |a| a.remuneration_type == "retrocession" } do |replacement_offer|
      replacement_offer.validates :salary, absence: true
      replacement_offer.validates :salary_period, absence: true
      replacement_offer.validates :retrocession, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    end

end
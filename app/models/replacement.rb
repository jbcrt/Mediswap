class Replacement < Offer
    belongs_to :user

    enum contract_type: { 
        remplacement_liberal_occasionnel: "Remplacement libéral occasionnel",
        remplacement_liberal_regulier: "Remplacement libéral régulier"
    }

    ## Les champs obligatoires pour les offres de remplacement
    validates :contract_type, inclusion: { in: Replacement.contract_types.keys }
    validates :working_time, inclusion: { in: Offer.working_times.keys }
    validates :starts_at, presence: true
    validates :retrocession, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    validates :on_call, inclusion: [true, false]
    validates :vehicle_required, inclusion: [true, false]
    validates :visit, inclusion: { in: Offer.visits.keys }
    validates :sector, inclusion: { in: Offer.sectors.keys }
    validates :secretariat, inclusion: { in: Offer.secretariats.keys }
    validates :housing_possibility, inclusion: [true, false]
    
    ## Les champs optionnels pour les offres de remplacement
    validates :daily_medical_acts_number, numericality: { greater_than: 0, only_integer: true }, allow_blank: true
    validates :software_used, length: { in: 1..30 }, allow_blank: true

    ## Les champs qui ne doivent pas apparaitre dans les offres de remplacement
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :candidate_job_experience, absence: true
    validates :candidate_description, absence: true
    validates :selling_price, absence: true
    validates :room_availability, absence: true
    validates :room_size, absence: true
    validates :room_price, absence: true
    validates :room_rent, absence: true
    validates :room_furnished, absence: true

    ## Les validations qui sont conditionnées au type de de contrat de remplacement selectionné
    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_occasionnel" } do |replacement_offer|
      replacement_offer.validates :ends_at, presence: true
    end

    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_regulier" } do |replacement_offer|
      replacement_offer.validates :ends_at, absence: true
    end

end
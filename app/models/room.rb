class Room < Offer
    belongs_to :user

    enum contract_type: { 
        cession_local: "Cession de local",
        location_local: "Location de local"
    }

    ## Les champs obligatoires pour les offres de cession
    validates :contract_type, inclusion: { in: Room.contract_types.keys }
    validates :size, presence: true, numericality: { greater_than: 0 }
    validates :furnished, inclusion: [true, false]
    
    ## Les champs qui ne doivent pas apparaitre dans les offres de cession
    validates :working_time, absence: true
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :retrocession, absence: true
    validates :candidate_job_experience, absence: true
    validates :candidate_description, absence: true
    validates :daily_medical_acts_number, absence: true
    validates :on_call, absence: true
    validates :vehicle_required, absence: true
    validates :visit, absence: true
    validates :sector, absence: true
    validates :secretariat, absence: true
    validates :software_used, absence: true
    validates :housing_possibility, absence: true

    # Les validations qui sont conditionnées par le type de contrat
    with_options if: Proc.new { |a| a.contract_type == "cession_local" } do |cession_local_offer|
        cession_local_offer.validates :price, presence: true, numericality: { greater_than: 0 }
        cession_local_offer.validates :rent, absence: true
    end

    with_options if: Proc.new { |a| a.contract_type == "location_local" } do |location_local_offer|
        location_local_offer.validates :price, absence: true
        location_local_offer.validates :rent, presence: true, numericality: { greater_than: 0 }
    end

end
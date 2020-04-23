class Association < Offer
    belongs_to :user

    before_validation :set_association_contract, on: :create

    enum contract_type: { 
        association: "Association",
        cession_patientele: "Cession de patientèle"
    }

    ## Les champs obligatoires pour les offres de cession
    validates :contract_type, inclusion: { in: Association.contract_types.keys }
    
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
    validates :selling_price, absence: true
    validates :premises_availability, absence: true
    validates :premises_size, absence: true
    validates :premises_price, absence: true
    validates :premises_rent, absence: true
    validates :premises_furnished, absence: true

    private

    def set_association_contract
        self.contract_type = "association"
    end

end
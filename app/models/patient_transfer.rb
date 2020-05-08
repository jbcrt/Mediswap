class PatientTransfer < Offer
    belongs_to :user

    before_validation :set_contract_type, on: :create

    enum contract_type: { 
        cession_patientele: "Cession de patientèle"
    }

    enum premises_availability: { 
        rental: "Location",
        sale: "Vente"
    }

    # Les champs autorisés pour les offres de cession
    validates :contract_type, inclusion: { in: PatientTransfer.contract_types.keys }
    validates :has_selling_price_set, inclusion: [true, false]
    validates :revenues, numericality: { greater_than: 0, only_integer: true }
    validates :premises_size, numericality: { greater_than: 0 }
    validates :premises_rooms_number, numericality: { greater_than: 0, only_integer: true }
    validates :premises_availability, inclusion: { in: PatientTransfer.premises_availabilities.keys }
    validates :premises_furnished, inclusion: [true, false]
    validates :premises_has_parking, inclusion: [true, false]
    validates :accessible_premises, inclusion: [true, false]

    # Les champs dont les validations sont conditionnées à la valeur de "has_selling_price_set"
    with_options if: Proc.new { |a| a.has_selling_price_set? } do |offer|
        offer.validates :selling_price, numericality: { greater_than_or_equal_to: 0 }
    end
    
    with_options if: Proc.new { |a| a.has_selling_price_set? == false } do |offer|
        offer.validates :selling_price, absence: true
    end
    
    # Les champs dont les validations sont conditionnées à la disponibilité de l'établissement
    with_options if: Proc.new { |a| a.sale? } do |offer|
        offer.validates :premises_price, presence: true, numericality: { greater_than: 0 }
        offer.validates :premises_rent, absence: true
    end
    
    with_options if: Proc.new { |a| a.rental? } do |offer|
        offer.validates :premises_price, absence: true
        offer.validates :premises_rent, presence: true, numericality: { greater_than: 0 }
    end
    
    # Les champs dont les validations sont conditionnées à la valeur de "premises_furnished"
    with_options if: Proc.new { |a| a.premises_furnished? } do |offer|
        offer.validates :premises_equipment, length: { in: 1..250 }
    end
    
    with_options if: Proc.new { |a| a.premises_furnished == false } do |offer|
        offer.validates :premises_equipment, absence: true
    end
    
    # Les champs qui ne doivent pas apparaitre dans les offres de cession
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :working_time, absence: true
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

    private

    def set_contract_type
        self.contract_type = "cession_patientele"
    end

end
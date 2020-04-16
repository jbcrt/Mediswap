class Establishment < Offer
    belongs_to :user

    before_validation :set_installation_contract, on: :create

    enum contract_type: {
        installation: "Installation"
    }
    
    enum room_availability: {
        room_cession: "Cession",
        room_location: "Location"
    }

    # Validations globales
    validates :contract_type, inclusion: { in: Establishment.contract_types.keys }
    validates :room_availability, inclusion: { in: Establishment.room_availabilities.keys }
    validates :room_size, presence: true, numericality: { greater_than: 0 }
    validates :room_furnished, inclusion: [true, false]
    
    # Validations conditionnelles
    with_options if: Proc.new { |a| a.room_cession? } do |offer|
        offer.validates :room_price, numericality: { greater_than: 0 }
        offer.validates :room_rent, absence: true
    end

    with_options if: Proc.new { |a| a.room_location? } do |offer|
        offer.validates :room_price, absence: true
        offer.validates :room_rent, numericality: { greater_than: 0 }
    end
    
    ## Les champs qui ne doivent pas apparaitre dans les offres de cession
    validates :working_time, absence: true
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :retrocession, absence: true
    validates :selling_price, absence: true
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

    def set_installation_contract
        self.contract_type = "installation"
    end

end
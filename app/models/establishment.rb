class Establishment < Offer
    belongs_to :user

    enum contract_type: {
        premises_cession: "Cession de local",
        premises_location: "Location de local"
    }

    # Validations globales
    validates :contract_type, inclusion: { in: Establishment.contract_types.keys }
    validates :premises_size, presence: true, numericality: { greater_than: 0 }
    validates :premises_rooms_number, presence: true, numericality: { greater_than: 0, only_integer: true }
    validates :premises_furnished, inclusion: [true, false]
    validates :premises_has_parking, inclusion: [true, false]
    validates :accessible_premises, inclusion: [true, false]
    
    # Validations conditionnelles
    with_options if: Proc.new { |a| a.premises_cession? } do |offer|
        offer.validates :premises_price, presence: true, numericality: { greater_than: 0 }
        offer.validates :premises_rent, absence: true
    end

    with_options if: Proc.new { |a| a.premises_location? } do |offer|
        offer.validates :premises_price, absence: true
        offer.validates :premises_rent, presence: true, numericality: { greater_than: 0 }
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

end
class Establishment < Offer
    belongs_to :user
    has_many :offer_applications, as: :applicable

    before_validation :set_contract_type_values, on: :create
    before_validation :set_conditional_values

    enum contract_type: {
        cession_local: "Cession de local",
        location_local: "Location de local"
    }

    # Les champs autorisés pour les offres d'installation
    validates :contract_type, inclusion: { in: Establishment.contract_types.keys }
    validates :premises_size, numericality: { greater_than: 0 }
    validates :premises_rooms_number, numericality: { greater_than: 0, only_integer: true }
    validates :premises_furnished, inclusion: [true, false]
    validates :premises_has_parking, inclusion: [true, false]
    validates :accessible_premises, inclusion: [true, false]
    
    # Les champs dont les validations sont conditionnées à la disponibilité du local
    with_options if: Proc.new { |a| a.cession_local? } do |offer|
        offer.validates :premises_price, numericality: { greater_than: 0 }
        offer.validates :premises_rent, absence: true
    end

    with_options if: Proc.new { |a| a.location_local? } do |offer|
        offer.validates :premises_price, absence: true
        offer.validates :premises_rent, numericality: { greater_than: 0 }
    end

    # Les champs dont les validations sont conditionnées à la valeur de "premises_furnished"
    with_options if: Proc.new { |a| a.premises_furnished? } do |offer|
        offer.validates :premises_equipment, length: { in: 1..250 }
    end
    
    with_options if: Proc.new { |a| a.premises_furnished == false } do |offer|
        offer.validates :premises_equipment, absence: true
    end

    # Les champs interdits pour les offres d'installation
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
    validates :has_selling_price_set, absence: true
    validates :selling_price, absence: true
    validates :revenues, absence: true
    validates :premises_availability, absence: true

    private

    def set_contract_type_values
        if self.cession_local?
            self.premises_rent = nil
        elsif self.location_local?
            self.premises_price = nil
        end
    end

    def set_conditional_values
        if self.premises_furnished == false
            self.premises_equipment = nil
        end
    end

end
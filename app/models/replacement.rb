class Replacement < Offer
    belongs_to :user

    enum contract_type: { 
        remplacement_liberal_occasionnel: "Remplacement libéral occasionnel",
        remplacement_liberal_regulier: "Remplacement libéral régulier"
    }

    ## Les champs autorisés pour les offres de remplacement
    validates :contract_type, inclusion: { in: Replacement.contract_types.keys }
    validates_date :starts_at, :on_or_after => :today
    validates :working_time, inclusion: { in: Offer.working_times.keys }
    validates :retrocession, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    validates :daily_medical_acts_number, numericality: { greater_than: 0, only_integer: true }, allow_blank: true
    validates :on_call, inclusion: [true, false], allow_blank: true
    validates :vehicle_required, inclusion: [true, false], allow_blank: true
    validates :visit, inclusion: { in: Offer.visits.keys }, allow_blank: true
    validates :sector, inclusion: { in: Offer.sectors.keys }, allow_blank: true
    validates :secretariat, inclusion: { in: Offer.secretariats.keys }, allow_blank: true
    validates :software_used, length: { in: 1..30 }, allow_blank: true
    validates :housing_possibility, inclusion: [true, false], allow_blank: true

    ## Les champs dont les validations sont conditionnées au type de contrat de remplacement selectionné
    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_occasionnel" } do |replacement_offer|
      replacement_offer.validates_date :ends_at, :after => :today
      replacement_offer.validate :starts_at_must_be_before_ends_at
    end

    with_options if: Proc.new { |a| a.contract_type == "remplacement_liberal_regulier" } do |replacement_offer|
      replacement_offer.validates :ends_at, absence: true
    end

    ## Les champs interdits pour les offres de remplacement
    validates :has_salary_set, absence: true
    validates :salary, absence: true
    validates :salary_period, absence: true
    validates :candidate_job_experience, absence: true
    validates :candidate_description, absence: true
    validates :has_selling_price_set, absence: true
    validates :selling_price, absence: true
    validates :revenues, absence: true
    validates :premises_size, absence: true
    validates :premises_rooms_number, absence: true
    validates :premises_availability, absence: true
    validates :premises_price, absence: true
    validates :premises_rent, absence: true
    validates :premises_furnished, absence: true
    validates :premises_equipment, absence: true
    validates :premises_has_parking, absence: true
    validates :accessible_premises, absence: true

    private

    def starts_at_must_be_before_ends_at
      return unless starts_at and ends_at
      errors.add(:ends_at, "doit être après la date de début") unless
         starts_at < ends_at
    end 

end
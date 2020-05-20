class Employment < Offer
    belongs_to :user

    before_validation :set_conditional_values

    enum contract_type: {
        contrat_assitant_hopitaux: "Assistant des hopitaux",
        contrat_duree_determinee: "Contrat à durée déterminée",
        contrat_duree_indeterminee: "Contrat à durée indéterminée",
        contrat_clinicien_hospitalier: "Clinicien hospitalier",
        contrat_exercice_liberal: "Exercice à titre libéral",
        contrat_assitant_hopitaux: "Praticien attaché",
        contrat_praticien_hospitalier_contractuel: "Praticien hospitalier contractuel",
    }

    enum salary_period: {
        hour: "Hourly",
        day: "Daily",
        week: "Weekly",
        month: "Monthly",
        year: "Yearly"
    }
    
    enum candidate_job_experience: { 
        without_preference: "Without Preference",
        junior: "Junior",
        intermediate: "Intermediate",
        senior: "Senior"
    }

    # Les champs autorisés pour les offres de salariat
    validates :contract_type, inclusion: { in: Employment.contract_types.keys }
    validates :working_time, inclusion: { in: Offer.working_times.keys }
    validates :has_salary_set, inclusion: [true, false]
    validates :candidate_job_experience, inclusion: { in: Employment.candidate_job_experiences.keys }
    validates :candidate_description, length: { in: 1..2500 }, allow_blank: true

    # Les champs dont les validations sont conditionnées à la valeur de "has_salary_set"
    with_options if: Proc.new { |a| a.has_salary_set? } do |employment_offer_with_salary_set|
        employment_offer_with_salary_set.validates :salary, numericality: { greater_than: 0 }
        employment_offer_with_salary_set.validates :salary_period, inclusion: { in: Employment.salary_periods.keys }
    end
  
    with_options if: Proc.new { |a| a.has_salary_set == false } do |employment_offer_without_salary_set|
        employment_offer_without_salary_set.validates :salary, absence: true
        employment_offer_without_salary_set.validates :salary_period, absence: true
    end

    # Les champs interdits pour les offres de salariat
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :retrocession, absence: true
    validates :daily_medical_acts_number, absence: true
    validates :on_call, absence: true
    validates :vehicle_required, absence: true
    validates :visit, absence: true
    validates :sector, absence: true
    validates :secretariat, absence: true
    validates :software_used, absence: true
    validates :selling_price, absence: true
    validates :housing_possibility, absence: true
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

    def set_conditional_values
        if self.has_salary_set == false
          self.salary = nil
          self.salary_period = nil
        end
    end

end
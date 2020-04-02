class Employment < Offer
    belongs_to :user

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

    # Les champs obligatoires pour les offres de salariat
    validates :contract_type, inclusion: { in: Employment.contract_types.keys }
    validates :working_time, inclusion: { in: Offer.working_times.keys }
    validates :has_salary_set, inclusion: [true, false]
    validates :candidate_job_experience, inclusion: { in: Employment.candidate_job_experiences.keys }
    
    # Les champs optionnels pour les offres de salariat
    validates :candidate_description, length: { in: 1..2500 }, allow_blank: true
    
    # Les champs qui ne doivent pas apparaitre dans les offres de salariat
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
    validates :housing_possibility, absence: true
    validates :size, absence: true
    validates :price, absence: true
    validates :rent, absence: true
    validates :furnished, absence: true

    # Les validations qui sont conditionnées à la valeur de "has_salary_set"
    with_options if: Proc.new { |a| a.has_salary_set } do |employment_offer_with_salary_set|
        employment_offer_with_salary_set.validates :salary, presence: true, numericality: { only_integer: true, greater_than: 0 }
        employment_offer_with_salary_set.validates :salary_period, inclusion: { in: Employment.salary_periods.keys }
    end
  
    with_options if: Proc.new { |a| a.has_salary_set == false } do |employment_offer_without_salary_set|
        employment_offer_without_salary_set.validates :salary, absence: true
        employment_offer_without_salary_set.validates :salary_period, absence: true
    end

end
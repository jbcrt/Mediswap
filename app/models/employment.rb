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

    # Les champs obligatoires pour les offres de salariat
    validates :contract_type, presence: true, inclusion: { in: Employment.contract_types.keys }
    validates :working_time, presence: true, inclusion: { in: Offer.working_times.keys }
    validates :has_salary_set, presence: true, allow_blank: true
    
    # Les champs optionnels pour les offres de salariat
    validates :candidate_job_experience, inclusion: { in: Offer.candidate_job_experiences.keys }, allow_blank: true
    validates :candidate_description, length: { in: 1..10000 }, allow_blank: true
    
    # Les champs qui ne doivent pas apparaitre dans les offres de salariat
    validates :starts_at, absence: true
    validates :ends_at, absence: true
    validates :retrocession, absence: true
    validates :vehicle, absence: true
    validates :home_visiting, absence: true
    validates :health_facility_visiting, absence: true
    validates :housing, absence: true
    validates :secretariat, absence: true
    validates :size, absence: true
    validates :price, absence: true
    validates :furnished, absence: true

    # Les validations qui sont conditionnées à la valeur de "has_salary_set"
    with_options if: Proc.new { |a| a.has_salary_set } do |employment_offer_with_salary_set|
        employment_offer_with_salary_set.validates :salary, presence: true, numericality: { only_integer: true, greater_than: 0 }
        employment_offer_with_salary_set.validates :salary_period, presence: true, inclusion: { in: Offer.salary_periods.keys }
    end
  
    with_options if: Proc.new { |a| a.has_salary_set == false } do |employment_offer_without_salary_set|
        employment_offer_without_salary_set.validates :salary, absence: true
        employment_offer_without_salary_set.validates :salary_period, absence: true
    end

end
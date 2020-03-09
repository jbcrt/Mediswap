class Offer < ApplicationRecord
  include Filterable
  belongs_to :user

  # Filtres de recherche
  scope :filter_by_profession, -> (profession) { where profession: profession }
  scope :filter_by_type, -> (type) { where offer_type: type }
  scope :filter_by_begins, -> (begins) { where("starts_at >= ?", begins) }
  scope :filter_by_ends, -> (ends) { where("ends_at <= ?", ends) }

  # Géolocalisation
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  enum offer_type: { 
    replacement: "Replacement",
    employment: "Employment",
    other: "Other"
  }

  enum replacement_contract: { 
    remplacement_liberal_occasionnel: "Remplacement libéral occasionnel",
    remplacement_liberal_regulier: "Remplacement libéral régulier",
  }
  
  enum employment_contract: { 
    contrat_assitant_hopitaux: "Assistant des hopitaux",
    contrat_duree_determinee: "Contrat à durée déterminée",
    contrat_duree_indeterminee: "Contrat à durée indéterminée",
    contrat_clinicien_hospitalier: "Clinicien hospitalier",
    contrat_exercice_liberal: "Exercice à titre libéral",
    contrat_assitant_hopitaux: "Praticien attaché",
    contrat_praticien_hospitalier_contractuel: "Praticien hospitalier contractuel",
  }

  enum other_contract: { 
    assistanat: "Assistanat",
    association: "Association",
    cession_local: "Cession de local",
    cession_patientele: "Cession de patientèle",
    collaboration: "Collaboration",
    location_local: "Location de local",
    vacation: "Vacation"
  }

  enum working_time: { 
    full_time: "Full time",
    part_time: "Part time"
  }

  enum remuneration_type: { 
    salary: "Salary",
    retrocession: "Retrocession"
  }

  enum candidate_job_experience: { 
    junior: "Junior",
    intermediate: "Intermediate",
    senior: "Senior"
  }

  enum salary_period: {
    day: "Daily",
    week: "Weekly",
    month: "Monthly",
    year: "Yearly"
  }

  # Validations
  validates :title, presence: true, length: { in: 1..50 }
  validates :profession, presence: true, inclusion: { in: PROFESSIONS.keys }
  validates :offer_type, presence: true, inclusion: { in: Offer.offer_types.keys }
  validates :description, presence: true, length: { in: 1..10000 }
  validates :street, presence: true, length: { in: 1..50 }
  validates :additional_address, length: { in: 1..50 }, allow_blank: true
  validates :department, presence: true, inclusion: { in: DEPARTMENTS }
  validates :zipcode, presence: true, length: { is: 5 }, format: { with: /\A^(?:[0-8]\d|9[0-8])\d{3}$\z/ }
  ## Validations spécifiques en fonction du type d'offre selectionné
  with_options if: Proc.new { |a| a.offer_type == "replacement" } do |offer|
    offer.validates :starts_at, presence: true
    offer.validates :ends_at, presence: true
    offer.validates :working_time, presence: true, inclusion: { in: Offer.working_times.keys }
    offer.validates :remuneration_type, presence: true, inclusion: { in: Offer.remuneration_types.keys }
    offer.validates :candidate_job_experience, inclusion: { in: Offer.candidate_job_experiences.keys }
    offer.validates :candidate_description, length: { in: 1..10000 }
    ## Validations spécifiques en fonction du type de rémunération selectionné
    with_options if: Proc.new { |a| a.remuneration_type == "salary" } do |offer|
      offer.validates :salary, numericality: { only_integer: true, greater_than: 0 }
      offer.validates :salary_period, presence: true, inclusion: { in: Offer.salary_periods.keys }
      offer.validates :retrocession, absence: true
    end
    with_options if: Proc.new { |a| a.remuneration_type == "retrocession" } do |offer|
      offer.validates :salary, absence: true
      offer.validates :salary_period, absence: true
      offer.validates :retrocession, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
    end
  end


  def address
    [street, department, zipcode, city].compact.join(', ')
  end

  def address_changed?
    street_changed? || department_changed? || zipcode_changed? || city_changed?
  end

  def remuneration_types
    ["full time", "partial time"]
  end

end

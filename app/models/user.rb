class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :confirmable
         
  has_many :offers, dependent: :destroy

  # Avatar upload
  mount_uploader :avatar_id, PhotoUploader

  # Validations
  validates :professional_id_number, format: { with: /\A[0-9]{11}\z/, message: "Le numéro RPPS indiqué n'est pas correct" }, if: Proc.new { |a| User.rpps_professions.include? a.profession }
  validates :professional_id_number, format: { with: /\A[0-9]{9}\z/, message: "Le numéro ADELI indiqué n'est pas correct" }, if: Proc.new { |a| User.adeli_professions.include? a.profession }
  validates_presence_of :title, :first_name, :last_name, :account_type, :profession, :professional_id_number

  def self.professions
    [
      "Médecin généraliste",
      "Chirurgien dentiste",
      "Sage-femme",
      "Pharmacien",
      "Masseur-kinésithérapeute",
      "Pédicure podologue",
      "Audioprothésiste",
      "Diététicien",
      "Epithésiste",
      "Ergothérapeute",
      "Infirmier",
      "Manipulateur en radiologie",
      "Oculariste",
      "Opticien-lunetier",
      "Orthpédiste-orthésiste",
      "Orthophoniste",
      "Orthoprothésiste",
      "Orthoptiste",
      "Podo-orthésiste",
      "Psychomotricien",
      "Technicien de laboratoire"
    ].sort
  end

  def self.rpps_professions
    [
      "Médecin généraliste",
      "Chirurgien dentiste",
      "Sage-femme",
      "Pharmacien",
      "Masseur-kinésithérapeute",
      "Pédicure podologue"
    ].sort
  end

  def self.adeli_professions 
    [
      "Audioprothésiste",
      "Diététicien",
      "Epithésiste",
      "Ergothérapeute",
      "Infirmier",
      "Manipulateur en radiologie",
      "Oculariste",
      "Opticien-lunetier",
      "Orthpédiste-orthésiste",
      "Orthophoniste",
      "Orthoprothésiste",
      "Orthoptiste",
      "Podo-orthésiste",
      "Psychomotricien",
      "Technicien de laboratoire"
    ].sort
  end

  def self.account_types
    ["Praticien libéral remplaçant", "Praticien libéral installé"].sort
  end

  def self.status
    ["Étudiant", "Diplomé"].sort
  end

end

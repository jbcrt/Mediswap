class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :confirmable
  
  mount_uploader :avatar_id, PhotoUploader

  validates_presence_of :title, :first_name, :last_name, :profession, :account_type, :personnal_phone_number
  validates_uniqueness_of :personnal_phone_number, :professional_id_number, :urssaf_number, :council_number

  has_many :offers, dependent: :destroy

  def self.professions
    ["Masseur-kinésithérapeute", "Chirurgien dentiste", "Infirmier", "Médecin généraliste"].sort
  end

  def self.account_types
    ["Praticien remplaçant", "Praticien installé"].sort
  end

  def self.status
    ["Étudiant", "Diplomé"].sort
  end

end

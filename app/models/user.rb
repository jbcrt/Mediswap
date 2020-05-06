class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable
  
  has_many :replacements, class_name: 'Replacement', dependent: :destroy
  has_many :employments, class_name: 'Employment', dependent: :destroy
  has_many :collaborations, class_name: 'Collaboration', dependent: :destroy
  has_many :patient_transfers, class_name: 'PatientTransfer', dependent: :destroy
  has_many :establishments, class_name: 'Establishment', dependent: :destroy

  has_one :facility, dependent: :destroy
  accepts_nested_attributes_for :facility
  
  has_one_attached :avatar

  attr_accessor :remove_avatar
  attr_readonly :profession, :user_type

  enum user_type: { 
    health_professional: "Health professional",
    health_facility_recruiter: "Health facility recruiter"
  }

  enum title: {
    mr: "Mister",
    mme: "Madam"
  }

  validates :title, presence: true, inclusion: { in: User.titles.keys }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_type, presence: true, inclusion: { in: User.user_types.keys }

  # Validations spécifiques pour les professionnels de santé
  with_options if: Proc.new { |a| a.user_type == "health_professional" } do |professional_user|
    professional_user.validates :profession, presence: true, inclusion: { in: PROFESSIONS.keys }
  end

  # Validations spécifiques pour les établissements de santé
  with_options if: Proc.new { |a| a.user_type == "health_facility" } do |facility_user|
    facility_user.validates :profession, absence: true
  end

  after_save :purge_avatar, if: :remove_avatar
  
  private
  
  def purge_avatar
    avatar.purge
  end

end
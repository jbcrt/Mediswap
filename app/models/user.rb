class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable
  attr_readonly :profession, :user_type
  has_many :offers, dependent: :destroy

  mount_uploader :avatar_id, PhotoUploader

  enum user_type: { 
    health_professional: "Health professional",
    health_facility: "Health facility"
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
    professional_user.validates :facility_type, inclusion: { in: FACILITY_TYPES.keys }, allow_blank: true

  end

  # Validations spécifiques pour les établissements de santé
  with_options if: Proc.new { |a| a.user_type == "health_facility" } do |facility_user|
    facility_user.validates :profession, absence: true
    facility_user.validates :candidate, absence: true
    facility_user.validates :facility_name, presence: true
    facility_user.validates :facility_type, presence: true, inclusion: { in: FACILITY_TYPES.keys }
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable
  
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  validates_associated :profile

  has_one :facility, dependent: :destroy
  
  has_many :replacements, class_name: 'Replacement', dependent: :destroy
  has_many :employments, class_name: 'Employment', dependent: :destroy
  has_many :collaborations, class_name: 'Collaboration', dependent: :destroy
  has_many :patient_transfers, class_name: 'PatientTransfer', dependent: :destroy
  has_many :establishments, class_name: 'Establishment', dependent: :destroy
  
  has_many :offer_applications, dependent: :destroy

end
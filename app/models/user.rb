class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :confirmable

validates_presence_of :title, :first_name, :last_name, :birth_date, :birth_place, :personnal_address, :personnal_postal_code_address, :personnal_city_address, :personnal_phone_number, :professionnal_phone_number, :profession, :status, :structure_name, :rpps_number, :urssaf_number, :council_number, :council_location, :council_email, :professionnal_address, :professionnal_postal_code_address, :professionnal_city_address
validates_uniqueness_of :personnal_phone_number
validates_uniqueness_of :rpps_number
validates_uniqueness_of :urssaf_number
validates_uniqueness_of :council_number

has_many :offers, dependent: :destroy

end

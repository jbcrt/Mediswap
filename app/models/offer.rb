class Offer < ApplicationRecord
  belongs_to :user
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :contract_type, presence: true
  validates :starts_at, presence: true
  validates :description, presence: true
  validates :retrocession, presence: true
  validates :address, presence: true

end

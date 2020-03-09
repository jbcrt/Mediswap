class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      # Offer's informations
      t.string :title
      t.string :profession
      t.string :offer_type
      t.string :replacement_contract
      t.string :employment_contract
      t.string :other_contract
      t.string :working_time
      t.date :starts_at
      t.date :ends_at
      t.string :duration_type
      t.string :duration_day
      t.string :duration_week
      t.string :duration_month
      t.string :duration_year
      t.text :description
      # Offer's remuneration
      t.string :remuneration_type
      t.string :salary
      t.string :salary_period
      t.string :retrocession
      # Offer's location
      t.string :street
      t.string :additional_address
      t.string :department
      t.string :zipcode
      t.string :city
      t.float :latitude
      t.float :longitude
      # Offer's candidate profile
      t.string :candidate_job_experience
      t.text :candidate_description
      # Offer's options
      t.boolean :vehicle
      t.boolean :home_visiting
      t.boolean :health_facility_visiting
      t.boolean :housing
      t.boolean :secretariat
      # Sale offer
      t.string :size
      t.string :price
      t.boolean :furnished
      # Offer's premium options
      t.boolean :urgent
      t.boolean :premium

      t.timestamps
    end
  end
end

class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      # Offer's informations
      t.string :title
      t.string :profession
      t.string :type
      t.string :contract_type
      t.string :working_time
      t.date :starts_at
      t.date :ends_at
      t.string :duration_type
      t.string :number_of_days
      t.string :number_of_weeks
      t.string :number_of_months
      t.string :number_of_years
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
      t.string :vehicle
      t.string :home_visiting
      t.string :health_facility_visiting
      t.string :housing
      t.string :secretariat
      # Sale offer
      t.string :size
      t.string :price
      t.boolean :furnished
      # Offer's premium options
      t.string :offer_type

      t.timestamps
    end
    add_index :offers, [:type, :user_id]
  end
end

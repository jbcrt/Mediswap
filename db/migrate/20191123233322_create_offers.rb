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
      t.text :description
      # Offer's remuneration
      t.boolean :has_salary_set
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
      t.string :sector
      t.string :software
      t.string :on_call
      t.string :size
      t.string :price
      t.string :rent
      t.boolean :furnished
      t.string :patients
      # Offer's premium option
      t.string :offer_type

      t.timestamps
    end
    add_index :offers, [:type, :user_id]
  end
end

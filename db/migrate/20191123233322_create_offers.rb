class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true

      # Offer's informations
      t.string :type
      t.string :title
      t.string :contract_type
      t.string :profession
      t.text :description

      # Offer's contracts specific fields
      t.string :working_time
      t.date :starts_at
      t.date :ends_at
      t.boolean :has_salary_set
      t.string :salary
      t.string :salary_period
      t.string :retrocession
      t.string :candidate_job_experience
      t.text :candidate_description

      # Offer's contracts specific fields (optional)
      t.string :daily_medical_acts_number
      t.boolean :on_call
      t.boolean :vehicle_required
      t.string :visit
      t.string :sector
      t.string :secretariat
      t.string :software_used
      t.boolean :housing_possibility
      t.string :selling_price

      # Offer's establishment specific fields
      t.string :premises_size
      t.string :premises_rooms_number
      t.string :premises_price
      t.string :premises_rent
      t.boolean :premises_furnished
      t.boolean :premises_has_parking
      t.boolean :accessible_premises

      # Offer's location fields
      t.string :street
      t.string :additional_address
      t.string :department
      t.string :zipcode
      t.string :city
      t.float :latitude
      t.float :longitude

      # Offer's premium field
      t.string :offer_type

      t.timestamps
    end
    add_index :offers, [:type, :user_id]
  end
end

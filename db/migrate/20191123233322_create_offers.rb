class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      # Offer's informations
      t.string :title
      t.string :profession
      t.string :offer_type
      t.date :starts_at
      t.date :ends_at
      # Offer's facility
      t.string :facility_name
      t.string :facility_type
      t.string :facility_description
      t.string :street
      t.string :additional_address
      t.string :department
      t.string :zipcode
      t.string :city
      t.float :latitude
      t.float :longitude
      # Offer's content
      t.text :description
      t.integer :retrocession
      t.boolean :vehicle
      t.boolean :home_visiting
      t.boolean :medical_institution_visiting
      t.boolean :housing
      t.boolean :secretariat
      # Offer's options
      t.boolean :urgent
      t.boolean :premium

      t.timestamps
    end
  end
end

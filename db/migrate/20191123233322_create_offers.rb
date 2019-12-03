class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      t.string :title
      t.string :profession
      t.string :offer_type
      t.date :starts_at
      t.date :ends_at
      t.string :offer_address
      t.string :offer_additional_address
      t.string :offer_postal_code_address
      t.string :offer_city_address
      t.float :latitude
      t.float :longitude
      t.text :description
      t.integer :retrocession
      t.boolean :vehicle
      t.boolean :housing
      t.boolean :secretariat

      t.timestamps
    end
  end
end

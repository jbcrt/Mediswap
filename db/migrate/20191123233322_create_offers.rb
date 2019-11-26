class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      t.string :title
      t.string :contract_type
      t.date :starts_at
      t.date :ends_at
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :retrocession
      t.boolean :vehicle
      t.boolean :housing
      t.boolean :secretariat

      t.timestamps
    end
  end
end

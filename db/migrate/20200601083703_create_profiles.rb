class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles, id: :uuid do |t|

      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      ## Avatar
      t.string :avatar_id
      ## Personnal informations
      t.string :title
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :phone_number
      ## professional informations
      t.string :profession
      t.string :professional_id_number
      t.string :council_id_number
      t.string :council_department

      t.timestamps
    end
  end
end

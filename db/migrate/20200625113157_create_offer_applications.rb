class CreateOfferApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_applications, id: :uuid do |t|

      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      t.references :applicable, polymorphic: true, type: :uuid
      t.string :status
      t.text :application_text
      t.date :accepted_by_recruiter_at
      t.date :declined_by_recruiter_at

      t.timestamps
    end
  end
end

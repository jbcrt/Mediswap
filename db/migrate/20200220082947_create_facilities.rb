class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities, id: :uuid do |t|
      t.references :user, type: :uuid, index: true, null: false, foreign_key: true
      t.boolean :completed, default: false
      t.string :name
      t.string :category
      t.string :finess_number
      t.text :description
      t.string :street
      t.string :additional_address
      t.string :department
      t.string :zipcode
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

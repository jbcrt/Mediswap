# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Admin
      t.boolean :admin, null: false, default: false
      
      ### User informations
      ## Personnal informations
      t.string :title
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :birth_place
      ## Personnal Address
      t.string :personnal_phone_number
      t.string :personnal_address
      t.string :personnal_additional_address
      t.string :personnal_postal_code_address
      t.string :personnal_city_address
      ## Professionnal informations
      t.string :profession
      t.string :status
      t.string :structure_name
      t.string :rpps_number
      t.string :adeli_number
      t.string :urssaf_number
      t.string :council_number
      t.string :council_location
      t.string :council_email
      ## Professionnal address
      t.string :professionnal_phone_number
      t.string :professionnal_address
      t.string :professionnal_additional_address
      t.string :professionnal_postal_code_address
      t.string :professionnal_city_address

      ## Created at & Updated at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
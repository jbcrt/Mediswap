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
      
      ## User informations
      t.string :avatar_id
      t.string :user_type
      t.boolean :candidate
      ## Personnal informations
      t.string :title
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :phone_number
      ## professional informations
      t.string :profession
      t.string :professional_id_number
      t.string :mssante_email
      t.string :council_id_number
      t.string :council_department
      ## facility informations
      t.string :facility_name
      t.string :facility_type
      t.string :facility_description
      t.string :facility_contact_email
      t.string :facility_contact_phone_number
      t.string :facility_street
      t.string :facility_additional_address
      t.string :facility_department
      t.string :facility_zipcode
      t.string :facility_city

      ## Created at & Updated at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end

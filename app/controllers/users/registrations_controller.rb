# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :title,
      :first_name,
      :last_name,
      :user_type,
      :profession,
      :facility_name,
      :facility_type
    ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :title,
      :first_name,
      :last_name,
      :birth_date,
      :avatar_id,
      :remove_avatar_id,
      :phone_number,
      :user_type,
      :candidate,
      :profession,
      :professional_id_number,
      :mssante_email,
      :council_id_number,
      :council_department,
      :facility_name,
      :facility_type,
      :facility_description,
      :facility_contact_email,
      :facility_contact_phone_number,
      :facility_street,
      :facility_additional_address,
      :facility_department,
      :facility_zipcode,
      :facility_city
    ])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  # Redirect user to his edit view after edit
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

end
class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :first_name, :last_name, :birth_date, :birth_place, :personnal_address, :personnal_additional_address, :personnal_postal_code_address, :personnal_city_address, :personnal_phone_number, :professionnal_phone_number, :profession, :status, :structure_name, :rpps_number, :adeli_number, :urssaf_number, :council_number, :council_location, :council_email, :professionnal_address, :professionnal_additional_address, :professionnal_postal_code_address, :professionnal_city_address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:title, :first_name, :last_name, :birth_date, :birth_place, :personnal_address, :personnal_additional_address, :personnal_postal_code_address, :personnal_city_address, :personnal_phone_number, :professionnal_phone_number, :profession, :status, :structure_name, :rpps_number, :adeli_number, :urssaf_number, :council_number, :council_location, :council_email, :professionnal_address, :professionnal_additional_address, :professionnal_postal_code_address, :professionnal_city_address])
    end
end

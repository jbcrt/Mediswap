class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pundit

    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # Uncomment when you *really understand* Pundit!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    def user_not_authorized
        policy_name = exception.policy.class.to_s.underscore

        flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
        redirect_to(request.referrer || root_path)
    end

    private

    def skip_pundit?
        devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end

    protected

    def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :title,
        :first_name,
        :last_name,
        :personnal_phone_number,
        :profession, :account_type
    ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [
        :title,
        :first_name,
        :last_name,
        :avatar_id,
        :remove_avatar_id,
        :birth_date,
        :birth_place,
        :account_type,
        :personnal_phone_number,
        :personnal_address,
        :personnal_additional_address,
        :personnal_postal_code_address,
        :personnal_city_address,
        :profession,
        :professional_status,
        :structure_name,
        :professional_id_number,
        :urssaf_number,
        :council_number,
        :council_location,
        :council_email,
        :professional_phone_number,
        :professional_address,
        :professional_additional_address,
        :professional_postal_code_address,
        :professional_city_address
    ])
    end
end

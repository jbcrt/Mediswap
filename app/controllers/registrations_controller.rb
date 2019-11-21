class RegistrationsController < Devise::RegistrationsController

    protected
      # Redirect user to his edit view after edit
      def after_update_path_for(resource)
        edit_user_registration_path(resource)
      end
end
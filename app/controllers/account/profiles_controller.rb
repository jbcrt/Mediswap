class Account::ProfilesController < ApplicationController
    before_action :set_profile, only: [:edit, :update]

    def edit
        authorize @profile
    end

    def update
        authorize @profile
        if @profile.update(profile_params)
            flash[:notice] = "Votre profile a bien été modifié."
            redirect_to edit_account_profile_path(@profile)
        else
            render :edit
        end
    end

    private

    def set_profile
        @profile = Profile.find(params[:id])
    end

    def profile_params
        params.require(:profile).permit(:title, :first_name, :last_name, :birth_date, :phone_number, :profession, :professional_id_number, :council_id_number, :council_department, :avatar)
    end
end

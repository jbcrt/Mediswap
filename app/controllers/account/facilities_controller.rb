class Account::FacilitiesController < ApplicationController
    before_action :set_facility, only: [:edit, :update, :delete_facility_attachment]

    def new
        @facility = Facility.new
        authorize @facility
    end

    def create
        @facility = Facility.create(facility_params)
        @facility.user_id = current_user.id
        authorize @facility
        if @facility.save
            flash[:notice] = "Votre établissement a bien été créé."
            redirect_to edit_account_facility_path(@facility)
        else
            render 'new'
        end
    end

    def edit
        authorize @facility
    end

    def update
        authorize @facility
        if @facility.update(facility_params)
            flash[:notice] = "Votre établissement a bien été modifié."
            redirect_to edit_account_facility_path(@facility)
        else
            render :edit
        end
    end

    def delete_facility_attachment
        authorize @facility
        @facility_image = ActiveStorage::Attachment.find(params[:attachment_id])
        @facility_image.purge_later
        redirect_to edit_account_facility_path(@facility)
    end

    private

    def set_facility
        @facility = Facility.find(params[:id])
    end

    def facility_params
        params.require(:facility).permit(:name, :category, :description, :street, :additional_address, :department, :zipcode, :city, photos: [])
    end
end

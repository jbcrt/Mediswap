class Account::FacilitiesController < ApplicationController
    before_action :set_facility, only: [:edit, :update, :delete_facility_attachment]

    def edit
        authorize @facility
    end

    def update
        authorize @facility
        if @facility.update(facility_params)
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
        params.require(:facility).permit(:name, :category, :finess_number, :description, :street, :additional_address, :department, :zipcode, :city, :same_address, photos: [])
    end
end

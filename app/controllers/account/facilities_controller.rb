class Account::FacilitiesController < ApplicationController
    before_action :set_facility, only: [:edit, :update]

    def edit
        authorize @facility
    end

    def update
        authorize @facility
        if @facility.valid?
            @facility.completed = true
        end
        if @facility.update(facility_params)
            redirect_to edit_account_facility_path(@facility)
        else
            render :edit
        end
    end

    private

    def set_facility
        @facility = Facility.find(params[:id])
    end

    def facility_params
        params.require(:facility).permit(:name, :category, :finess_number, :description, :phone_number, :email_address, :street, :additional_address, :department, :zipcode, :city)
    end
end

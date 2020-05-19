class OffersController < ApplicationController

    def index

      @offers = Offer.filter(filter_params).order(offer_type: :asc, created_at: :desc)

      if params[:location].present? && params[:distance].present? && params[:distance] != "0"
        @offers = @offers.near(params[:location], params[:distance])
      elsif params[:location].present?
        @offers = @offers.near(params[:location])
      end

      @offers = policy_scope(@offers)
      
      @markers = @offers.map do |offer|
        {
          lat: offer.latitude,
          lng: offer.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { offer: offer })
        }
      end

    end
  
    def show
      @offer = Offer.find(params[:id])
      authorize @offer, policy_class: OfferPolicy
    end

    def new
      @offer = current_user.send(set_type.pluralize).new
      authorize @offer, policy_class: OfferPolicy
    end

    def create
      @offer = current_user.send(set_type.pluralize).create(offer_params(set_type))
      authorize @offer, policy_class: OfferPolicy
      if @offer.save
        redirect_to offer_path(@offer)
      else
        render 'new', notice: "Votre annonce n'a pas pu être déposée."
      end
    end

    private

    def set_type
      case params[:type]
      when "Replacement"
        "replacement"
      when "Employment"
        "employment"
      when "Collaboration"
        "collaboration"
      when "PatientTransfer"
        "patient_transfer"
      when "Establishment"
        "establishment"
      end
    end

    def offer_params(type)
      case type
      when "replacement"
        params.require(:replacement).permit(
          :title,
          :description,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :contract_type,
          :starts_at,
          :ends_at,
          :working_time,
          :retrocession,
          :daily_medical_acts_number,
          :on_call,
          :vehicle_required,
          :visit,
          :sector,
          :secretariat,
          :software_used,
          :housing_possibility,
          :offer_type
        )
      when "employment"
        params.require(:employment).permit(
          :title,
          :description,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :profession,
          :contract_type,
          :working_time,
          :has_salary_set,
          :salary,
          :salary_period,
          :candidate_job_experience,
          :candidate_description,
          :offer_type
        )
      when "collaboration"
        params.require(:collaboration).permit(
          :title,
          :description,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :contract_type,
          :retrocession,
          :daily_medical_acts_number,
          :on_call,
          :vehicle_required,
          :visit,
          :sector,
          :secretariat,
          :software_used,
          :housing_possibility,
          :offer_type
        )
      when "patient_transfer"
        params.require(:patient_transfer).permit(
          :title,
          :description,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :has_selling_price_set,
          :selling_price,
          :revenues,
          :premises_availability,
          :premises_price,
          :premises_rent,
          :premises_size,
          :premises_rooms_number,
          :premises_furnished,
          :premises_equipment,
          :premises_has_parking,
          :accessible_premises,
          :offer_type
        )
      when "establishment"
        params.require(:establishment).permit(
          :title,
          :description,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :profession,
          :contract_type,
          :premises_price,
          :premises_rent,
          :premises_size,
          :premises_rooms_number,
          :premises_furnished,
          :premises_equipment,
          :premises_has_parking,
          :accessible_premises,
          :offer_type
        )
      end
    end

    def filter_params
      params.slice(:profession, :contract_type, :begins, :ends)
    end

end

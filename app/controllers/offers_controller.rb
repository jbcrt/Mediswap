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
      when "Room"
        "room"
      end
    end

    def offer_params(type)
      case type
      when "replacement"
        params.require(:replacement).permit(
          :title,
          :profession,
          :contract_type,
          :working_time,
          :starts_at,
          :ends_at,
          :description,
          :retrocession,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :vehicle,
          :home_visiting,
          :health_facility_visiting,
          :housing,
          :secretariat,
          :offer_type
        )
      when "employment"
        params.require(:employment).permit(
          :title,
          :profession,
          :contract_type,
          :working_time,
          :description,
          :has_salary_set,
          :salary,
          :salary_period,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :candidate_job_experience,
          :candidate_description,
          :offer_type
        )
      when "collaboration"
        params.require(:collaboration).permit(
          :title,
          :contract_type,
          :description,
          :retrocession,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :vehicle,
          :home_visiting,
          :health_facility_visiting,
          :housing,
          :secretariat,
          :offer_type
        )
      when "room"
        params.require(:room).permit(
          :title,
          :contract_type,
          :description,
          :size,
          :price,
          :rent,
          :furnished,
          :street,
          :additional_address,
          :department,
          :zipcode,
          :city,
          :offer_type
        )
      end
    end

    def filter_params
      params.slice(:profession, :type, :begins, :ends)
    end

end

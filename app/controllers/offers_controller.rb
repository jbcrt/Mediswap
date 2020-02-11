class OffersController < ApplicationController

    def index

      @offers = Offer.filter(filter_params).order(premium: :desc, created_at: :desc)

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

      # respond_to do |format|
      #   format.html
      #   format.js
      # end

    end
  
    def show
      @offer = Offer.find(params[:id])
      authorize @offer
    end

    def new
      @offer = Offer.new
      authorize @offer
    end

    def create
      @offer = current_user.offers.create(offer_params)
      if current_user.user_type == "health_professional"
        @offer.profession = current_user.profession
      end
      @offer.save
      authorize @offer

      if @offer.save
        redirect_to offer_path(@offer)
      else
        render 'new', notice: "Votre annonce n'a pas pu être déposée."
      end
    end

    private

    def offer_params
      params.require(:offer).permit(
        :title,
        :profession,
        :offer_type,
        :starts_at,
        :ends_at,
        :facility_name,
        :facility_type,
        :facility_description,
        :street,
        :additional_address,
        :department,
        :zipcode,
        :city,
        :latitude,
        :longitude,
        :description,
        :retrocession,
        :vehicle,
        :home_visiting,
        :medical_institution_visiting,
        :housing,
        :secretariat,
        :urgent,
        :premium
      )
    end

    def filter_params
      params.slice(:profession, :type, :begins, :ends)
    end

end

class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

    def index
      @location = params["location"]
      @distance = params["distance"]
      if @location.present? && @distance.present?
        @offers = policy_scope(Offer).near(@location, @distance).order(created_at: :desc)
      elsif @location.present?
        @offers = policy_scope(Offer).near(@location, 20).order(created_at: :desc)
      else
        @offers = policy_scope(Offer).all.order(created_at: :desc)
      end

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
      authorize @offer
    end

    def new
      @offer = Offer.new
      # Get contrat types linked to the current user's profession
      @offer_type = Offer.offer_types(current_user.profession)
      authorize @offer
    end

    def create
      @offer = current_user.offers.build(offer_params)
      @offer.profession = current_user.profession
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
        :offer_address,
        :offer_additional_address,
        :offer_postal_code_address,
        :offer_city_address,
        :latitude,
        :longitude,
        :description,
        :retrocession,
        :vehicle,
        :housing,
        :secretariat
      )
    end

end

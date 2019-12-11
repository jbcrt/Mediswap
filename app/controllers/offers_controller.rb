class OffersController < ApplicationController

    def index
      @premium_offers = policy_scope(Offer).profession(current_user.profession).where(premium: true).order(created_at: :desc)
      @offers = policy_scope(Offer).profession(current_user.profession).where(premium: false).order(created_at: :desc)
      
      if params[:location].present? && params[:distance].present? && params[:distance] != "0"
        @premium_offers = @premium_offers.near(params[:location], params[:distance])
        @offers = @offers.near(params[:location], params[:distance])
      elsif params[:location].present?
        @premium_offers = @premium_offers.location(params[:location])
        @offers = @offers.location(params[:location])
      end
      
      filtering_params(params).each do |key, value|
        @premium_offers = @premium_offers.public_send(key, value) if value.present?
        @offers = @offers.public_send(key, value) if value.present?
      end

      @all_offers = @offers + @premium_offers
      
      @markers = @all_offers.map do |offer|
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
      authorize @offer
    end

    def create
      @offer.profession = current_user.profession
      @offer = current_user.offers.build(offer_params)
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
        :home_visiting,
        :medical_institution_visiting,
        :housing,
        :secretariat,
        :urgent,
        :premium
      )
    end

    def filtering_params(params)
      params.slice(:type, :begins, :ends, :urgent)
    end

end

class OffersController < ApplicationController
    def index
        @offers = policy_scope(Offer).all

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
        authorize @offer
      end
  
      def create
        @offer = current_user.offers.build(offer_params)
        @offer.address = "#{@offer.user.professionnal_address}, #{@offer.user.professionnal_postal_code_address}, #{@offer.user.professionnal_city_address}"
        authorize @offer

        if @offer.save
          redirect_to offer_path(@offer)
        else
          render 'new', notice: "Votre annonce n'a pas pu être déposée."
        end
      end
  
      private
  
      def offer_params
        params.require(:offer).permit(:title, :starts_at, :ends_at, :contract_type, :description, :retrocession, :vehicle, :housing, :secretariat)
      end
end

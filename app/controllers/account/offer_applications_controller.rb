class Account::OfferApplicationsController < ApplicationController

    def index
        @offer_applications = current_user.offer_applications.order(created_at: :desc)
    end

    def create
        @offer_application = OfferApplication.new(offer_application_params)
        @offer = Offer.find(params[:offer_id])
        @offer_application.applicable = @offer
        @offer_application.user = current_user
        authorize @offer_application, policy_class: OfferApplicationPolicy
        if @offer_application.save
            flash[:notice] = "Votre candidature a bien été enregistrée."
            redirect_to offer_path(@offer)
        else
            flash[:alert] = "Votre candidature n'a pas été enregistrée."
            render "offers/show"
        end
    end

    private

    def set_offer_application
        @offer_application = OfferApplication.find(params[:id])
    end

    def offer_application_params
        params.require(:offer_application).permit(:application_text)
    end
end

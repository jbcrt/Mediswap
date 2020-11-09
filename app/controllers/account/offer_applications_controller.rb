class Account::OfferApplicationsController < ApplicationController
    before_action :set_offer_application, only: [:recruiter_accept, :recruiter_refuse]

    def index
        @offer_applications = policy_scope(OfferApplication).where(user_id: current_user).order(created_at: :desc)
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

    def applications
        @offer = Offer.find(params[:offer_id])
        @offer_applications = @offer.offer_applications.order(created_at: :desc)
        authorize @offer_application, policy_class: OfferApplicationPolicy
    end

    def recruiter_accept
        @offer_application.accepted_by_recruiter_at = DateTime.current
        @offer_application.status = "accepted"
        authorize @offer_application, policy_class: OfferApplicationPolicy
        if @offer_application.save
            refuse_pending_applications
            flash[:notice] = "La candidature de #{ @offer_application.user.profile.first_name} #{ @offer_application.user.profile.last_name} a bien été acceptée."
            redirect_to account_offer_applications_linked_path
        end
    end
    
    def recruiter_refuse
        @offer_application.declined_by_recruiter_at = DateTime.current
        @offer_application.status = "rejected"
        authorize @offer_application, policy_class: OfferApplicationPolicy
        if @offer_application.save
            flash[:notice] = "La candidature de #{ @offer_application.user.profile.first_name} #{ @offer_application.user.profile.last_name} a bien été rejetée."
            redirect_to account_offer_applications_linked_path
        end
    end

    private

    def set_offer_application
        @offer_application = OfferApplication.find(params[:offer_application_id])
    end

    def offer_application_params
        params.require(:offer_application).permit(:application_text)
    end

    def refuse_pending_applications
        set_offer_application
        applications = OfferApplication.where(applicable: @offer_application.applicable).each do |application|
          unless application.id == @offer_application.id
            application.declined_by_recruiter_at = DateTime.current
            application.status = "rejected"
            application.save
          end
        end
    end
end

class My::OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy]

  def index
    @offers = policy_scope(Offer).where(user: current_user)
  end

  def edit
    @offer
  end

  def update
    @offer
  end

  def destroy
    @offer
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer, policy_class: OfferPolicy
  end

  def offer_params
    params.require(:offer).permit(:title, :starts_at, :ends_at, :contract_type, :description, :retrocession, :vehicle, :housing, :secretariat)
  end
end
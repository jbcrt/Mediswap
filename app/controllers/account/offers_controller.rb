class Account::OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy]

  def index
    @offers = policy_scope(Offer).where(user_id: current_user).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      flash[:notice] = "Votre annonce a bien été modifiée."
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end
  
  def destroy
    if @offer.destroy
      flash[:notice] = "Votre annonce a bien été supprimée."
      redirect_to account_offers_path
    else
      flash[:alert] = "Une erreur est survenue, votre annonce n'a pas pu être supprimée."
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer, policy_class: OfferPolicy
  end

  def offer_params
    if params[:replacement]
      params.require(:replacement).permit(
        :title,
        :description,
        :street,
        :additional_address,
        :department,
        :zipcode,
        :city,
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
        :housing_possibility
      )
    elsif params[:employment]
      params.require(:employment).permit(
        :title,
        :description,
        :street,
        :additional_address,
        :department,
        :zipcode,
        :city,
        :profession,
        :working_time,
        :has_salary_set,
        :salary,
        :salary_period,
        :candidate_job_experience,
        :candidate_description
      )
    elsif params[:collaboration]
      params.require(:collaboration).permit(
        :title,
        :description,
        :street,
        :additional_address,
        :department,
        :zipcode,
        :city,
        :retrocession,
        :daily_medical_acts_number,
        :on_call,
        :vehicle_required,
        :visit,
        :sector,
        :secretariat,
        :software_used,
        :housing_possibility
      )
    elsif params[:patient_transfer]
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
        :accessible_premises
      )
    elsif params[:establishment]
      params.require(:establishment).permit(
        :title,
        :description,
        :street,
        :additional_address,
        :department,
        :zipcode,
        :city,
        :profession,
        :premises_price,
        :premises_rent,
        :premises_size,
        :premises_rooms_number,
        :premises_furnished,
        :premises_equipment,
        :premises_has_parking,
        :accessible_premises
      )
    end
  end

end
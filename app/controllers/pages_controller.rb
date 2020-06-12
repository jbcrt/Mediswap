class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home
    @offer_count = Offer.count
    @user_count = User.count
    @offers = Offer.where(offer_type: "Premium").order(created_at: :desc).first(6)
  end

  def contact
  end

  def terms
  end

  def privacy
  end

  def new_offer
  end
end

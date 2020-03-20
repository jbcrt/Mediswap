class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home
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

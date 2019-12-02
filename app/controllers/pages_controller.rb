class PagesController < ApplicationController
  def home
  	@syndicates = Syndicate.all
  	@users = User.all
    @profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def about
  end

  def companies
  end

  def premium
  end
end

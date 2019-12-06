class PagesController < ApplicationController
  def home
  	@syndicates = Syndicate.all
  	@users = User.all
    if current_user_subscribed?
      @profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    else
      @profiles = Profile.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    end
  end

  def about
  end

  def companies
  end

  def lists
  end

  def premium
  end
end
